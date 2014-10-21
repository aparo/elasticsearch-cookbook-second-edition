curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_count?pretty=true' -d '{"match_all":{}}'
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_count?pretty=true&q=uuid:11111'
curl -XGET 'http://127.0.0.1:9200/test-index/test-type2/_count?pretty=true'

