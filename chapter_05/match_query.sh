curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "match" : {
            "parsedtext" : "nice guy",
            "operator": "and"
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "match_phrase" : {
            "parsedtext" : "nice guy"
        }
    }
}'
