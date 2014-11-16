package org.elasticsearch.action.simple;

import java.io.IOException;
import org.elasticsearch.action.support.broadcast.BroadcastShardOperationRequest;
import org.elasticsearch.common.io.stream.StreamInput;
import org.elasticsearch.common.io.stream.StreamOutput;
import org.elasticsearch.index.shard.ShardId;

class ShardSimpleRequest extends BroadcastShardOperationRequest {

    private String field;
    private String index;

    ShardSimpleRequest() {
    }

    public ShardSimpleRequest(ShardId shardId, SimpleRequest request) {
        super(shardId, request);
        this.field = request.getField();
        this.index=shardId.getIndex();
    }

    public String getField() {
        return field;
    }

    public String index() {
        return index;
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