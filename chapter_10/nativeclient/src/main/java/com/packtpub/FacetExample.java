package com.packtpub;

import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.client.Client;
import org.elasticsearch.search.facet.FacetBuilder;
import org.elasticsearch.search.facet.statistical.StatisticalFacet;
import org.elasticsearch.search.facet.terms.TermsFacet;

import static org.elasticsearch.index.query.QueryBuilders.*;
import static org.elasticsearch.search.facet.FacetBuilders.*;

public class FacetExample {
    public static void main(String[] args) {
        String index = "mytest";
        String type = "mytype";
        QueryHelper qh = new QueryHelper();
        qh.populateData(index, type);
        Client client=qh.getClient();
        FacetBuilder facetBuilder=termsFacet("tag").field("tag");
        FacetBuilder facetBuilder2=statisticalFacet("number1").field("number1");

        SearchResponse response = client.prepareSearch(index).setTypes(type)
                .setQuery(matchAllQuery()).addFacet(facetBuilder).addFacet(facetBuilder2)
                .execute().actionGet();
        if(response.status().getStatus()==200){
            System.out.println("Matched number of documents: " + response.getHits().totalHits());
            TermsFacet facet = response.getFacets().facet("tag");
            System.out.println("Facet name: " + facet.getName());
            System.out.println("Facet total: " + facet.getTotalCount());
            System.out.println("Facet missing: " + facet.getMissingCount());
            System.out.println("Facet other: " + facet.getOtherCount());
            for (TermsFacet.Entry entry:facet.getEntries()){
                System.out.println(" - " + entry.getCount()+" "+entry.getTerm());
            }

            StatisticalFacet facet2 = response.getFacets().facet("number1");
            System.out.println("Facet name: " + facet2.getName());
            System.out.println("Count: " + facet2.getCount());
            System.out.println("Min: " + facet2.getMin());
            System.out.println("Max: " + facet2.getMax());
            System.out.println("Mean: " + facet2.getMean());
            System.out.println("Standard Deviation: " + facet2.getStdDeviation());
            System.out.println("Sum of Squares: " + facet2.getSumOfSquares());
            System.out.println("Variance: " + facet2.getVariance());
            System.out.println("Total: " + facet2.getTotal());

        }
        qh.dropIndex(index);
    }
}
