curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true&size=0' -d '{
  "query": {
    "match_all": {}
  },
  "aggs": {
    "prices": {
      "range": {
        "field": "price",
        "ranges": [
          {"to": 10},
          {"from": 10,"to": 20},
          {"from": 20,"to": 100},
          {"from": 100}
        ]
      }
    },
    "ages": {
      "range": {
        "field": "age",
        "ranges": [
          {"to": 25},
          {"from": 25,"to": 50},
          {"from": 50,"to": 75},
          {"from": 75}
        ]
      }
    },
    "range": {
      "range": {
        "field": "date",
        "ranges": [
          {"from": "2012-01-01","to": "2012-07-01"},
          {"from": "2012-07-01","to": "2012-12-31"},
          {"from": "2013-01-01","to": "2013-12-31"}
        ]
      }
    }
  }
}'

