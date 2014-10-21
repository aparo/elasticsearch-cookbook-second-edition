package org.elasticsearch.action.simple;

import java.io.IOException;
import org.elasticsearch.action.support.broadcast.BroadcastShardOperationRequest;
import org.elasticsearch.common.io.stream.StreamInput;
import org.elasticsearch.common.io.stream.StreamOutput;

class ShardSimpleRequest extends BroadcastShardOperationRequest {

    private String field;
    
    ShardSimpleRequest() {
    }

    public ShardSimpleRequest(String index, int shardId, SimpleRequest request) {
        super(index, shardId, request);
        this.field = request.getField();
    }
    
    public void setField(String field) {
        this.field = field;
    }
    
    public String getField() {
        return field;
    }    

    @Override
    public void readFrom(StreamInput in) throws IOException {
        super.readFrom(in);
        field = in.readString();
    }

    @Override
    public void writeTo(StreamOutput out) throws IOException {
        super.writeTo(out);
        out.writeString(field);
    }
}