curl -XPOST 'http://127.0.0.1:9200/test-index/test-type2/_search?pretty=true' -d '{
    "query": {
            "has_parent" : {
                "type" : "test-type",
                "query" : {
                    "term" : {
                        "parsedtext" : "joe"
                    }
                }
            }
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type2/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                 "has_parent" : {
                     "type" : "test-type",
                     "query" : {
                        "term" : {
                            "parsedtext" : "joe"
                        }
                     }
                 }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'
