curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "exists": {
                    "field":"parsedtext"
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "missing": {
                    "field":"parsedtext"
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'