curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '
{
    "query": {
        "match_all": {}
    },
    "facets": {
        "ullam_docs": {
            "filter" : {
 		      "term" : { "tag" : "ullam" }
}
        },
        "age37_docs": {
            "filter" : {
 		      "term" : { "age" : 37 }
}
        }
    }
}'

