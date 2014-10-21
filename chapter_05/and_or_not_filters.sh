curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "and": [
                {
                    "term": {
                        "parsedtext":"joe"    
                    }
                    
                },
                {
                    "term": {
                        "uuid":"11111"
                    }
                    
                }]
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "or": [
                {
                    "term": {
                        "uuid":"11111"
                    }
                },
                {
                    "term": {
                        "uuid":"22222"
                    }
                    
                }]
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'

curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
    "query": {
        "filtered": {
            "filter": {
                "not": {
                    "term": {
                        "uuid":"11111"
                    }
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'
