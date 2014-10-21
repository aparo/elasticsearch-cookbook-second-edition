curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=0' -d '{
    "query": {
        "match_all": {}
    },
    "aggs": {
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
        }
    }
}'

curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=0' -d '{
    "query": {
        "match_all": {}
    },
    "aggs": {
        "age" : {
            "histogram" : {
                "field" : "age",
                "script": "_value*3",
                "interval" : 5
            }
        }
    }
}'

curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=0' -d '{
    "query": {
        "match_all": {}
    },
    "aggs": {
        "age" : {
            "histogram" : {
                "script": "doc['age'].value",
                "interval" : 5
            }
        }
    }
}'
