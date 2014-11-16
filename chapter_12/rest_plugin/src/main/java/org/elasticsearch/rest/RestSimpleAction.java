package org.elasticsearch.rest;

import java.io.IOException;
import org.elasticsearch.action.ActionListener;
import org.elasticsearch.action.simple.SimpleAction;
import org.elasticsearch.action.simple.SimpleRequest;
import org.elasticsearch.action.simple.SimpleResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.Strings;
import org.elasticsearch.common.inject.Inject;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.xcontent.XContentBuilder;
import static org.elasticsearch.rest.RestRequest.Method.GET;
import static org.elasticsearch.rest.RestRequest.Method.POST;
import static org.elasticsearch.rest.RestStatus.OK;
import static org.elasticsearch.rest.action.support.RestActions.buildBroadcastShardsHeader;


public class RestSimpleAction extends BaseRestHandler {
    @Inject
    public RestSimpleAction(Settings settings, Client client, RestController controller) {
        super(settings, controller, client);
        controller.registerHandler(POST, "/_simple", this);
        controller.registerHandler(POST, "/{index}/_simple", this);
        controller.registerHandler(POST, "/_simple/{field}", this);
        controller.registerHandler(GET, "/_simple", this);
        controller.registerHandler(GET, "/{index}/_simple", this);
        controller.registerHandler(GET, "/_simple/{field}", this);
    }

    @Override
    protected void handleRequest(final RestRequest request, final  RestChannel channel, final  Client client) throws Exception {
        final SimpleRequest simpleRequest = new SimpleRequest(Strings.splitStringByCommaToArray(request.param("index")));
        simpleRequest.setField(request.param("field"));
        client.execute(SimpleAction.INSTANCE, simpleRequest, new ActionListener<SimpleResponse>() {


            @Override
            public void onResponse(SimpleResponse response) {
                try {
                    XContentBuilder builder = channel.newBuilder();
                    builder.startObject();
                    builder.field("ok", true);
                    buildBroadcastShardsHeader(builder, response);
                    builder.array("terms", response.getSimple().toArray());
                    builder.endObject();
                    channel.sendResponse(new BytesRestResponse(OK, builder));
                } catch (Exception e) {
                    onFailure(e);
                }
            }

            @Override
            public void onFailure(Throwable e) {
                try {
                    channel.sendResponse(new BytesRestResponse(channel, e));
                } catch (IOException e1) {
                    logger.error("Failed to send failure response", e1);
                }
            }
        });
    }

}
