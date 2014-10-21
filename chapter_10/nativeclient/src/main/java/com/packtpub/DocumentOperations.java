package com.packtpub;

import org.elasticsearch.action.delete.DeleteResponse;
import org.elasticsearch.action.get.GetResponse;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.xcontent.XContentFactory;
import org.elasticsearch.script.ScriptService;

import java.io.IOException;

public class DocumentOperations {



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

        IndexResponse ir=client.prepareIndex(index, type, "2").setSource("text", "value").execute().actionGet();
        System.out.println("Version: "+ir.getVersion());
        GetResponse gr=client.prepareGet(index, type, "2").execute().actionGet();
        System.out.println("Version: "+gr.getVersion());

        UpdateResponse ur = client.prepareUpdate(index, type, "2").setScript("ctx._source.text = 'v2'", ScriptService.ScriptType.INLINE).execute().actionGet();
        System.out.println("Version: "+ur.getVersion());

        DeleteResponse dr = client.prepareDelete(index, type, "2").execute().actionGet();
        io.deleteIndex(index);
    }
}
