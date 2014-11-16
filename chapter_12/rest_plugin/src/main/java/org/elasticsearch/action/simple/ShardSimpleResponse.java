package org.elasticsearch.action.simple;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.elasticsearch.action.support.broadcast.BroadcastShardOperationResponse;
import org.elasticsearch.common.io.stream.StreamInput;
import org.elasticsearch.common.io.stream.StreamOutput;
import org.elasticsearch.index.shard.ShardId;

class ShardSimpleResponse extends BroadcastShardOperationResponse {

    private Set<String> simple;
    
    ShardSimpleResponse() {
    }

    public ShardSimpleResponse(ShardId shardId, Set<String> simple) {
        super(shardId);
        this.simple = simple;
    }
    
    public Set<String> getTermList() {
        return simple;
    }

    @Override
    public void readFrom(StreamInput in) throws IOException {
        super.readFrom(in);
        int n = in.readInt();
        simple = new HashSet<String>(n);
        for (int i = 0; i <n; i++) {
            simple.add(in.readString());
        }        
    }

    @Override
    public void writeTo(StreamOutput out) throws IOException {
        super.writeTo(out);
        out.writeInt(simple.size());
        for (String t : simple) {
            out.writeString(t);
        }
    }
}