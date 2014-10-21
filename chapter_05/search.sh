curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{"query":{"match_all":{}}}'
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true&q=uuid:11111'
curl -XGET 'http://127.0.0.1:9200/test-index/test-type2/_search?pretty=true'

curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true&df=uuid&q=11111'
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true&q=parsedtext:joe&fields=name'
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true&q=parsedtext:joe&explain=true'
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true&sort=name:desc'