curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "range" : {
	                "position" : { 
	                    "from" : 3, 
	                    "to" : 4, 
	                    "include_lower" : true, 
	                    "include_upper" : false
	                }
	            }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'

