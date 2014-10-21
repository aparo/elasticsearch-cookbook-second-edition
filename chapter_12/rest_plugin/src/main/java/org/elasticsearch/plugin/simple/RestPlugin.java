package org.elasticsearch.plugin.simple;

import org.elasticsearch.action.ActionModule;
import org.elasticsearch.action.simple.SimpleAction;
import org.elasticsearch.action.simple.TransportSimpleAction;
import org.elasticsearch.plugins.AbstractPlugin;
import org.elasticsearch.rest.RestModule;
import org.elasticsearch.rest.RestSimpleAction;

public class RestPlugin extends AbstractPlugin {

    @Override
    public String name() {
        return "simple-plugin";
    }

    @Override
    public String description() {
        return "A simple plugin implementation";
    }

    public void onModule(RestModule module) {
        module.addRestAction(RestSimpleAction.class);
    }

    public void onModule(ActionModule module) {
        module.registerAction(SimpleAction.INSTANCE, TransportSimpleAction.class);
    }

}
