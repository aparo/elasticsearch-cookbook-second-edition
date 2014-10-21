curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "term": {
            "uuid": "33333"
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "term": {
                    "uuid": "33333"
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'

