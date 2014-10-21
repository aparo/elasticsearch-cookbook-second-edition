package org.elasticsearch.river.simple;

import org.elasticsearch.common.inject.AbstractModule;
import org.elasticsearch.river.River;

/**
 *
 */
public class SimpleRiverModule extends AbstractModule {

    @Override
    protected void configure() {
        bind(River.class).to(SimpleRiver.class).asEagerSingleton();
    }
}
