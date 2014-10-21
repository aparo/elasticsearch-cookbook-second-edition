package com.packtpub;

import org.elasticsearch.action.bulk.BulkRequestBuilder;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.script.ScriptService;

import java.io.IOException;

public class BulkOperations {



    public static void main( String[] args )
    {
        String index="mytest";
        String type="mytype";
        Client client =NativeClient.createTransportClient();
        IndicesOperations io=new IndicesOperations(client);
        if(io.checkIndexExists(index))
            io.deleteIndex(index);

        try {
            client.admin().indices().prepareCreate(index)
                    .addMapping(type, XContentFactory.jsonBuilder()
                            .startObject()
                            .startObject(type)
                            .startObject("_timestamp").field("enabled", true).field("store", "yes").endObject()
                            .startObject("_ttl").field("enabled", true).field("store", "yes").endObject()
                            .endObject()
                            .endObject())
                    .execute().actionGet();
        } catch (IOException e) {
            System.out.println("Unable to create mapping");
        }

        BulkRequestBuilder bulker=client.prepareBulk();
        for (Integer i=1; i<=1000; i++){
            bulker.add(client.prepareIndex(index, type, i.toString()).setSource("text", i.toString()));
        }
        System.out.println("Number of actions for index: " + bulker.numberOfActions());
        bulker.execute().actionGet();

        bulker=client.prepareBulk();
        for (Integer i=1; i<=1000; i++){
            bulker.add(client.prepareUpdate(index, type, i.toString()).setScript("ctx._source.text += 2", ScriptService.ScriptType.INLINE));
        }
        System.out.println("Number of actions for udpate: " + bulker.numberOfActions());
        bulker.execute().actionGet();

        bulker=client.prepareBulk();
        for (Integer i=1; i<=1000; i++){
            bulker.add(client.prepareDelete(index, type, i.toString()));
        }
        System.out.println("Number of actions  for delete: " + bulker.numberOfActions());
        bulker.execute().actionGet();

        io.deleteIndex(index);
    }
}
