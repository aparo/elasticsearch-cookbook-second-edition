# [2013-07-13T16:46:00.351486]
curl -XHEAD 'http://127.0.0.1:9200/test-aggs?pretty=true'
curl -XDELETE 'http://127.0.0.1:9200/test-aggs?pretty=true'
curl -XHEAD 'http://127.0.0.1:9200/test-aggs?pretty=true'
curl -XPOST 'http://127.0.0.1:9200/test-aggs/_refresh?pretty=true'
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
curl -XPUT 'http://127.0.0.1:9200/test-aggs/test-type/1?pretty=true' -d '{"tag": ["es"], "val": 10}'
curl -XPUT 'http://127.0.0.1:9200/test-aggs/test-type/2?pretty=true' -d '{"tag": ["es"], "val": 20}'
curl -XPUT 'http://127.0.0.1:9200/test-aggs/test-type/3?pretty=true' -d '{"tag": ["es", "mongodb"], "val": 20}'
curl -XPUT 'http://127.0.0.1:9200/test-aggs/test-type/4?pretty=true' -d '{"tag": ["mongodb"], "val": 10}'
curl -XPOST 'http://127.0.0.1:9200/test-aggs/_flush?pretty=true'

curl -XPOST 'http://127.0.0.1:9200/test-aggs/_search?pretty=true' -d '{"query":{"match_all":{}},"facets":{"tag":{"terms_stats":{"key_field":"tag","value_field":"val"}}}}'


