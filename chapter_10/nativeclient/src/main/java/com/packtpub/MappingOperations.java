package com.packtpub;

import org.elasticsearch.action.admin.indices.mapping.put.PutMappingResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.common.xcontent.XContentBuilder;

import java.io.IOException;

import static org.elasticsearch.common.xcontent.XContentFactory.jsonBuilder;

public class MappingOperations {

    public static void main( String[] args )
    {
        String index="mytest";
        String type="mytype";
        Client client =NativeClient.createTransportClient();
        IndicesOperations io=new IndicesOperations(client);
        if(io.checkIndexExists(index))
            io.deleteIndex(index);
        io.createIndex(index);

        XContentBuilder builder = null;
        try {
            builder = jsonBuilder().
                    startObject().
                    field("type1").
                    startObject().
                    field("properties").
                    startObject().
                    field("nested1").
                    startObject().
                    field("type").
                    value("nested").
                    endObject().
                    endObject().
                    endObject().
                    endObject();
            PutMappingResponse response=client.admin().indices().preparePutMapping(index).setType(type).setSource(builder).execute().actionGet();
            if(!response.isAcknowledged()){
                System.out.println("Something strange happens");
            }
        } catch (IOException e) {
            System.out.println("Unable to create mapping");
        }

        client.admin().indices().prepareDeleteMapping(index).setType(type).execute().actionGet();

        io.deleteIndex(index);
    }
}
