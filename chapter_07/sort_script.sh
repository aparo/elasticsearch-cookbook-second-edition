curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=3' -d '{
    "query": {
        "match_all": {}
    },
    "sort": {
        "_script" : {
            "script" : "sqrt(doc[\"price\"].value * factor)",
            "type" : "number",
            "lang":"groovy",
            "ignore_unmapped" : true,
            "params" : {
                "factor" : 1.1
            },
            "order" : "asc"
        }
    }
}'
