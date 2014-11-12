curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      },
      "filter": {
        "script": {
          "script": "doc[\"price\"].value * 2 > 8"
        }
      }
    }
  }
}'


curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{
  "query": {
    "filtered": {
      "query": {
        "match_all": {}
      },
      "filter": {
        "script": {
          "script": "doc[\"price\"].value * multiplier >greater",
          "params": {
            "multiplier": 2,
            "greater": 8
          }
        }
      }
    }
  }
}'
