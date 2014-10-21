curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "span_first" : {
            "match" : {
                "span_term" : { "parsedtext" : "joe" }
            },
            "end" : 5
        }
    }
}'
