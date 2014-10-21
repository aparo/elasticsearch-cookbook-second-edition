package org.elasticsearch.plugin.analysis;

import org.elasticsearch.common.inject.Module;
import org.elasticsearch.index.analysis.AnalysisModule;
import org.elasticsearch.index.analysis.CustomEnglishBinderProcessor;
import org.elasticsearch.plugins.AbstractPlugin;

public class AnalysisPlugin extends AbstractPlugin {

    @Override
    public String name() {
        return "analysis-plugin";
    }

    @Override
    public String description() {
        return "An analysis plugin implementation";
    }

    @Override public void processModule(Module module) {
        if (module instanceof AnalysisModule) {
            AnalysisModule analysisModule = (AnalysisModule) module;
            analysisModule.addProcessor(new CustomEnglishBinderProcessor());
        }
    }
}
