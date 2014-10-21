curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=3' -d '{
    "query": {
        "filtered": {
            "filter": {
                "script": {
                    "script": "val res:Boolean = longField(\"age\") > intParam(\"param1\"); res.asInstanceOf[java.lang.Boolean]",
                    "lang":"scala",
                    "params" : {
                        "param1" : 80
                    }
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'

curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?&pretty=true&size=3' -d '{
    "query": {
        "filtered": {
            "filter": {
                "script": {
                    "script": "(longField(\"age\") > intParam(\"param1\")).asInstanceOf[java.lang.Boolean]",
                    "lang":"scala",
                    "params" : {
                        "param1" : 80
                    }
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'