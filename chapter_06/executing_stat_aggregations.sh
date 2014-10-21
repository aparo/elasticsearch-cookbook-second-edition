curl -XPOST "http://127.0.0.1:9200/test-index/_search?size=0&pretty" -d '
{
    "query": {
        "match_all": {}
    },
    "aggs": {
      "age_stats": {
        "extended_stats": {
          "field": "age"
        }
      }
    }
}'
