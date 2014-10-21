curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
            "ids" : {
                "type" : "test-type",
                "values" : ["1", "2", "3"]
            }
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "ids" : {
                    "type" : "test-type",
                    "values" : ["1", "2", "3"]
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'
