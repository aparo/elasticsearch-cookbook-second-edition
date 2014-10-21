package org.elasticsearch.river.simple;

import org.elasticsearch.action.bulk.BulkProcessor;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.Requests;
import org.elasticsearch.common.inject.Inject;
import org.elasticsearch.common.unit.TimeValue;
import org.elasticsearch.common.util.concurrent.EsExecutors;
import org.elasticsearch.common.xcontent.XContentBuilder;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.common.xcontent.support.XContentMapValues;
import org.elasticsearch.river.AbstractRiverComponent;
import org.elasticsearch.river.River;
import org.elasticsearch.river.RiverName;
import org.elasticsearch.river.RiverSettings;
import org.elasticsearch.threadpool.ThreadPool;

import java.util.Map;
import java.util.UUID;

public class SimpleRiver extends AbstractRiverComponent implements River {

    private final Client client;
    private final String indexName;
    private final String typeName;
    private final int bulkSize;
    private int simpleNumber;
    private String fieldName;
    private volatile BulkProcessor bulkProcessor;
    private volatile boolean closed = false;
    private TimeValue poll;
    private Thread thread;
    private int bulkThreshold;

    @SuppressWarnings({"unchecked"})
    @Inject
    public SimpleRiver(RiverName riverName, RiverSettings settings, Client client, ThreadPool threadPool) {
        super(riverName, settings);
        this.client = client;

        if (settings.settings().containsKey("simple")) {
            Map<String, Object> simpleSettings = (Map<String, Object>) settings.settings().get("simple");
            simpleNumber = XContentMapValues.nodeIntegerValue(simpleSettings.get("number"), 100);
            fieldName = XContentMapValues.nodeStringValue(simpleSettings.get("field"), "test");
            poll = XContentMapValues.nodeTimeValue(simpleSettings.get("poll"), TimeValue.timeValueMinutes(60));
        }

        logger.info("creating simple stream river for [{} numbers] with field [{}]", simpleNumber, fieldName);

        if (settings.settings().containsKey("index")) {
            Map<String, Object> indexSettings = (Map<String, Object>) settings.settings().get("index");
            indexName = XContentMapValues.nodeStringValue(indexSettings.get("index"), riverName.name());
            typeName = XContentMapValues.nodeStringValue(indexSettings.get("type"), "simple_type");
            bulkSize = XContentMapValues.nodeIntegerValue(indexSettings.get("bulk_size"), 100);
            bulkThreshold = XContentMapValues.nodeIntegerValue(indexSettings.get("bulk_threshold"), 10);
        } else {
            indexName = riverName.name();
            typeName = "simple_type";
            bulkSize = 100;
            bulkThreshold = 10;
        }

    }

    @Override
    public void start() {
        logger.info("starting simple stream");
        bulkProcessor = BulkProcessor.builder(client,
                new BulkProcessor.Listener() {

                    @Override
                    public void beforeBulk(long executionId,
                                           BulkRequest request) {
                        logger.info("Going to execute new bulk composed of {} actions",
                                request.numberOfActions());
                    }

                    @Override
                    public void afterBulk(long executionId,
                                          BulkRequest request,
                                          BulkResponse response) {
                        logger.info("Executed bulk composed of {} actions",
                                request.numberOfActions());
                    }

                    @Override
                    public void afterBulk(long executionId,
                                          BulkRequest request,
                                          Throwable failure) {
                        logger.warn("Error executing bulk", failure);
                    }
                }).setBulkActions(bulkSize).setFlushInterval(TimeValue.timeValueMinutes(5))
                .setConcurrentRequests(bulkThreshold).build();

        thread = EsExecutors.daemonThreadFactory(settings.globalSettings(), "Simple processor").newThread(new SimpleConnector());
        thread.start();
    }

    @Override
    public void close() {
        logger.info("closing simple stream river");
        bulkProcessor.close();
        this.closed = true;
        thread.interrupt();
    }

    private void delay() {
        if (poll.millis() > 0L) {
            logger.info("next run waiting for {}", poll);
            try {
                Thread.sleep(poll.millis());
            } catch (InterruptedException e) {
                logger.error("Error during waiting.", e, (Object) null);
            }
        }
    }

    private class SimpleConnector implements Runnable {
        @Override
        public void run() {
            while (!closed) {
                try {
                    for (int i = 0; i < simpleNumber; i++) {
                        XContentBuilder builder = XContentFactory.jsonBuilder();
                        builder.startObject();

                        builder.field(fieldName, i);
                        builder.endObject();
                        bulkProcessor.add(Requests.indexRequest(indexName).type(typeName).id(UUID.randomUUID().toString()).create(true).source(builder));
                    }
                    //in this case we force the bulking, but it should seldom done
                    bulkProcessor.flush();
                    delay();
                } catch (Exception e) {
                    logger.error(e.getMessage(), e, (Object) null);
                    closed = true;
                }
                if (closed) {
                    return;
                }
            }
        }
    }
}
