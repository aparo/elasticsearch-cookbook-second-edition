curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
            "has_child" : {
                "type" : "test-type2",
                "query" : {
                    "term" : {
                        "value" : "value1"
                    }
                }
            }
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                 "has_child" : {
                     "type" : "test-type2",
                     "query" : {
                        "term" : {
                            "value" : "value1"
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
