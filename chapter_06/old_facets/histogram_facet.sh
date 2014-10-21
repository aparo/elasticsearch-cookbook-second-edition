curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=0' -d '{
    "query": {
        "match_all": {}
    },
    "facets": {
        "age" : {
            "histogram" : {
                "field" : "age",
                "interval" : 5
            }
        },
        "price" : {
            "histogram" : {
                "field" : "price",
                "interval" : 10.0
            }
        },
        "date" : {
            "histogram" : {
                "field" : "date",
                "time_interval" : "180d"
            }
        }
    }
}'
