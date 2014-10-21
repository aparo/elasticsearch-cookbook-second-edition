curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=3' -d '{
    "query": {
        "match_all": {}
    },
    "script_fields" : {
        "my_calc_field" : {
            "script" : "doc[\"name\"].value + \" -- \" + doc[\"description\"].value"
        },
        "my_calc_field2" : {
            "script" : "doc[\"price\"].value * discount",
            "params" : {
                "discount"  : 0.8
            }
        }
    }
}'
