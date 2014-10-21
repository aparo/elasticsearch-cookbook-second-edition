curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=0' -d '{
    "query": {
        "match_all": {}
    },
    "facets": {
        "price_for_tag" : {
            "terms_stats" : {
                "key_field" : "tag",
                "value_field" : "price"
            }
        }
    }
}'

