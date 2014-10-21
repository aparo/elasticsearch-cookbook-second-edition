curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "span_multi":{
           "match":{
                "prefix" : { "parsedtext" :  { "value" : "jo" } }
           }
        }
    }
}'
