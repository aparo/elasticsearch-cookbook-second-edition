package org.elasticsearch.plugin.river.simple;

import org.elasticsearch.common.inject.Inject;
import org.elasticsearch.plugins.AbstractPlugin;
import org.elasticsearch.river.RiversModule;
import org.elasticsearch.river.simple.SimpleRiverModule;

/**
 *
 */
public class SimpleRiverPlugin extends AbstractPlugin {

    @Inject
    public SimpleRiverPlugin() {
    }

    @Override
    public String name() {
        return "river-simple";
    }

    @Override
    public String description() {
        return "River Simple Plugin";
    }

    public void onModule(RiversModule module) {
        module.registerRiver("simple", SimpleRiverModule.class);
    }
}
