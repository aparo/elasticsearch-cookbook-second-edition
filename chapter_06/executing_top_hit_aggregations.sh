curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty' -d '{
  "query": {
    "match_all": {}
  },
  "size": 0,
  "aggs": {
    "tags": {
      "terms": {
        "field": "tag",
        "size": 2
      },
      "aggs": {
        "top_tag_hits": {
          "top_hits": {
            "sort": [
              {
                "age": {
                  "order": "desc"
                }
              }
            ],
            "_source": {
              "include": [
                "name"
              ]
            },
            "size": 1
          }
        }
      }
    }
  }
}'

