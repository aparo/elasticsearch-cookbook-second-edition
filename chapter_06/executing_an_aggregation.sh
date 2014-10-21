curl -XPOST "http://127.0.0.1:9200/test-index/_search?size=0&pretty" -d '
{
    "query": {
        "match_all": {}
    },
    "aggs": {
        "tag": {
            "terms": {
                "field": "tag",
                "size": 10
            }
        }
    }
}'

