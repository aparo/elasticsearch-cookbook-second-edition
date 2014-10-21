package com.packtpub;

import org.elasticsearch.action.admin.indices.exists.indices.IndicesExistsResponse;
import org.elasticsearch.client.Client;

public class IndicesOperations {
    private final Client client;

    public IndicesOperations(Client client) {
        this.client = client;
    }

    public boolean checkIndexExists(String name){
        IndicesExistsResponse response=client.admin().indices().prepareExists(name).execute().actionGet();
        return response.isExists();
    }

    public void createIndex(String name){
        client.admin().indices().prepareCreate(name).execute().actionGet();

    }

    public void deleteIndex(String name){
        client.admin().indices().prepareDelete(name).execute().actionGet();
    }

    public void closeIndex(String name){
        client.admin().indices().prepareClose(name).execute().actionGet();
    }

    public void openIndex(String name){
        client.admin().indices().prepareOpen(name).execute().actionGet();
    }

    public void putMapping(String index, String typeName, String source){
        client.admin().indices().preparePutMapping(index).setType(typeName).setSource(source).execute().actionGet();
    }

    public void deleteMapping(String index, String typeName){
        client.admin().indices().prepareDeleteMapping(index).setType(typeName).execute().actionGet();
    }

    public static void main( String[] args ) throws InterruptedException {
        Client client =NativeClient.createTransportClient();
        IndicesOperations io=new IndicesOperations(client);
        String myIndex = "test";
        if(io.checkIndexExists(myIndex))
            io.deleteIndex(myIndex);
        io.createIndex(myIndex);
        Thread.sleep(1000);
        io.closeIndex(myIndex);
        io.openIndex(myIndex);
        io.deleteIndex(myIndex);
    }
}
