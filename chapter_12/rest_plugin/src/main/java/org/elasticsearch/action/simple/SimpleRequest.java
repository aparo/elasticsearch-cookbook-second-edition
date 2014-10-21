package org.elasticsearch.action.simple;

import java.io.IOException;
import org.elasticsearch.action.support.broadcast.BroadcastOperationRequest;
import org.elasticsearch.common.io.stream.StreamInput;
import org.elasticsearch.common.io.stream.StreamOutput;

public class SimpleRequest extends BroadcastOperationRequest<SimpleRequest> {

    private String field;
    
    SimpleRequest() {}
    
    public SimpleRequest(String... indices) {
        super(indices);
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
