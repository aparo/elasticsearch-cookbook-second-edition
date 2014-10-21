curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?size=0&pretty' -d '
{
    "query": {
        "match_all": {}
    },
    "aggs": {
        "missin_code": {
            "missing" : {
 		      "field" : "code"
            }
        }
    }
}'

