package org.elasticsearch.action.simple;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.elasticsearch.action.ShardOperationFailedException;
import org.elasticsearch.action.support.broadcast.BroadcastOperationResponse;
import org.elasticsearch.common.io.stream.StreamInput;
import org.elasticsearch.common.io.stream.StreamOutput;

/**
 * A response for simple action.
 *
 */
public class SimpleResponse extends BroadcastOperationResponse {

    private Set<String> simple;

    SimpleResponse() {
    }

    SimpleResponse(int totalShards, int successfulShards, int failedShards, List<ShardOperationFailedException> shardFailures, Set<String> simple) {
        super(totalShards, successfulShards, failedShards, shardFailures);
        this.simple = simple;
    }

    public Set<String> getSimple() {
        return simple;
    }
    
    @Override
    public void readFrom(StreamInput in) throws IOException {
        super.readFrom(in);
       int n = in.readInt();
        simple = new HashSet<String>();
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