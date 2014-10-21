package com.packtpub;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.aggregations.AggregationBuilder;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.metrics.stats.extended.ExtendedStats;
import org.elasticsearch.search.aggregations.metrics.stats.extended.ExtendedStatsBuilder;

import static org.elasticsearch.index.query.QueryBuilders.matchAllQuery;
import static org.elasticsearch.search.aggregations.AggregationBuilders.*;

public class AggregationExample {
    public static void main(String[] args) {
        String index = "mytest";
        String type = "mytype";
        QueryHelper qh = new QueryHelper();
        qh.populateData(index, type);
        Client client = qh.getClient();
        AggregationBuilder aggsBuilder = terms("tag").field("tag");
        ExtendedStatsBuilder aggsBuilder2 = extendedStats("number1").field("number1");

        SearchResponse response = client.prepareSearch(index).setTypes(type)
                .setQuery(matchAllQuery()).addAggregation(aggsBuilder).
                        addAggregation(aggsBuilder2)
                .execute().actionGet();
        if (response.status().getStatus() == 200) {
            System.out.println("Matched number of documents: " + response.getHits().totalHits());
            Terms termsAggs = response.getAggregations().get("tag");
            System.out.println("Aggregation name: " + termsAggs.getName());
            System.out.println("Aggregation total: " + termsAggs.getBuckets().size());
            for (Terms.Bucket entry : termsAggs.getBuckets()) {
                System.out.println(" - " + entry.getKey() + " " + entry.getDocCount());
            }

            ExtendedStats extStats = response.getAggregations().get("number1");
            System.out.println("Aggregation name: " + extStats.getName());
            System.out.println("Count: " + extStats.getCount());
            System.out.println("Min: " + extStats.getMin());
            System.out.println("Max: " + extStats.getMax());
            System.out.println("Standard Deviation: " + extStats.getStdDeviation());
            System.out.println("Sum of Squares: " + extStats.getSumOfSquares());
            System.out.println("Variance: " + extStats.getVariance());

        }
        qh.dropIndex(index);
    }
}
