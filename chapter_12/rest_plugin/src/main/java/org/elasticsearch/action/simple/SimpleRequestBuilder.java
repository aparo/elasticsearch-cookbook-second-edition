package org.elasticsearch.action.simple;

import org.elasticsearch.action.ActionListener;
import org.elasticsearch.action.support.broadcast.BroadcastOperationRequestBuilder;
import org.elasticsearch.client.Client;

/**
 * A request to get simples of one or more indices.
 */
public class SimpleRequestBuilder extends BroadcastOperationRequestBuilder<SimpleRequest, SimpleResponse, SimpleRequestBuilder, Client> {

    public SimpleRequestBuilder(Client client) {
        super(client, new SimpleRequest());
    }

    @Override
    protected void doExecute(ActionListener<SimpleResponse> listener) {
        client.execute(SimpleAction.INSTANCE, request, listener);
    }
}
