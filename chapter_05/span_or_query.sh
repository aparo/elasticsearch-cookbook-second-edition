curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "span_or" : {
        	"clauses" : [
            	{ "span_term" : { "parsedtext" : "nice" } },
            	{ "span_term" : { "parsedtext" : "cool" } },
            	{ "span_term" : { "parsedtext" : "wonderful" } }
        	]
    	}
    }
}'
