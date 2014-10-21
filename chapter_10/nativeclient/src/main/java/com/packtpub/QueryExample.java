package com.packtpub;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.search.SearchHit;

import static org.elasticsearch.index.query.FilterBuilders.termFilter;
import static org.elasticsearch.index.query.QueryBuilders.boolQuery;
import static org.elasticsearch.index.query.QueryBuilders.filteredQuery;
import static org.elasticsearch.index.query.QueryBuilders.rangeQuery;

public class QueryExample {
    public static void main(String[] args) {
        String index = "mytest";
        String type = "mytype";
        QueryHelper qh = new QueryHelper();
        qh.populateData(index, type);
        Client client=qh.getClient();

        QueryBuilder query = filteredQuery(boolQuery().must(rangeQuery("number1").gte(500)), termFilter("number2", 1));

        SearchResponse response = client.prepareSearch(index).setTypes(type)
                .setQuery(query).addHighlightedField("name")
                .execute().actionGet();
        if(response.status().getStatus()==200){
            System.out.println("Matched number of documents: " + response.getHits().totalHits());
            System.out.println("Maximum score: " + response.getHits().maxScore());

            for(SearchHit hit: response.getHits().getHits()){
                System.out.println("hit: "+hit.getIndex()+":"+hit.getType()+":"+hit.getId());
            }
        }
        qh.dropIndex(index);
    }
}
