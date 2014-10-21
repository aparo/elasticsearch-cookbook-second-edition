package com.packtpub;

import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.settings.Settings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;
import org.elasticsearch.node.Node;
import static org.elasticsearch.node.NodeBuilder.*;

/**
 * Created by alberto on 9/15/13.
 */
public class NativeClient {
    public static Client createTransportClient() {
        final Settings settings = ImmutableSettings.settingsBuilder()
                .put("client.transport.sniff", true)
                .put("cluster.name", "escookbook").build();

        return new TransportClient(settings)
                .addTransportAddress(new InetSocketTransportAddress("127.0.0.1", 9300));
    }

    private final Node node;
    private final Client client;
    public NativeClient(){
        node = nodeBuilder().clusterName("elasticsearch").client(true).node();
        client = node.client();
    }

    public Client getClient() {
        return client;
    }

    public void close(){
        node.close();
    }
}
