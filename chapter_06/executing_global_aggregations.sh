curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?size=0&pretty=true' -d '
{
    "query": {
        "term" : { "tag" : "ullam" }
    },
    "aggregations": {
        "query_age_avg": {
            "avg" : {
                "field" :  "age" 
            }
        },
        "all_persons":{
            "global": {},
            "aggs":{
                "age_global_avg": {
                    "avg" : {
                      "field" :  "age" 
                    }
                }
            }
        }
    }
}'
