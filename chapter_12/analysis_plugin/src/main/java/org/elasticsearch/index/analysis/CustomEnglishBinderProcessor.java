package org.elasticsearch.index.analysis;

public class CustomEnglishBinderProcessor extends AnalysisModule.AnalysisBinderProcessor {

    @Override public void processAnalyzers(AnalyzersBindings analyzersBindings) {
        analyzersBindings.processAnalyzer(CustomEnglishAnalyzerProvider.NAME, CustomEnglishAnalyzerProvider.class);
    }

}
