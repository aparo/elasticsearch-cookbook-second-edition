curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true&size=0' -d ' {
    "query" : {
        "match_all" : {}
    },
    "aggs" : {
        "position" : {
            "geo_distance" : {
                "field":"position",
                "origin" : {
                    "lat": 83.76, 
                    "lon": -81.20
                },
                "ranges" : [
                    { "to" : 10 },
                    { "from" : 10, "to" : 20 },
                    { "from" : 20, "to" : 50 },
                    { "from" : 50, "to" : 100 },
                    { "from" : 100 }
                ]
            }
        }
    }
}'
