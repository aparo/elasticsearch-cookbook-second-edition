curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=0' -d '{
    "query": {
        "match_all": {}
    },
    "facets": {
        "prices": {
            "range": {
                "field": "price",
                "ranges" : [
                    { "to" : 10.0 },
                    { "from" : 10.0, "to" : 20.0 },
                    { "from" : 20.0, "to" : 100.0 },
                    { "from" : 100.0 }
                ]
            }
        },
        "ages": {
            "range": {
                "field": "age",
                "ranges" : [
                    { "to" : 25 },
                    { "from" : 25, "to" : 50 },
                    { "from" : 50, "to" : 75 },
                    { "from" : 75 }
                ]
            }
        }
    }
}'

