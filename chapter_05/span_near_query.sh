curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "span_near" : {
            "clauses" : [
                { "span_term" : { "parsedtext" : "nice" } },
                { "span_term" : { "parsedtext" : "joe" } },
                { "span_term" : { "parsedtext" : "guy" } }
            ],
            "slop" : 3,
            "in_order" : false,
            "collect_payloads" : false
        }
    }
}'
