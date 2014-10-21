curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
            "top_children" : {
                "type" : "test-type2",
                "query" : {
                    "term" : {
                        "value" : "value1"
                    }
                },
                "score" : "max",
                "factor" : 5,
                "incremental_factor" : 2            
            }
        }
    }
}'
