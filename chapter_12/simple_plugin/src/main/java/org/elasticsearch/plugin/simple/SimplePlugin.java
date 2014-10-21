package org.elasticsearch.plugin.simple;

import org.elasticsearch.plugins.AbstractPlugin;

public class SimplePlugin extends AbstractPlugin {

    @Override
    public String name() {
        return "simple-plugin";
    }

    @Override
    public String description() {
        return "A simple plugin implementation";
    }

}
