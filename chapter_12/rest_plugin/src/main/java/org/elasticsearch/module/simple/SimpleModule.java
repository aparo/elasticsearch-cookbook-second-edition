package org.elasticsearch.module.simple;

import org.elasticsearch.action.ActionModule;
import org.elasticsearch.action.simple.SimpleAction;
import org.elasticsearch.action.simple.TransportSimpleAction;

public class SimpleModule extends ActionModule {

    public SimpleModule() {
        super(true);
    }
    
    @Override
    protected void configure() {
        registerAction(SimpleAction.INSTANCE, TransportSimpleAction.class);
    }
}
