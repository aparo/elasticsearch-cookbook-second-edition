# [2013-11-22T15:32:21.795000]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:21.795724]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:21.816200]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"pos": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:21.824381]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"position": 1, "parsedtext": "Joe Testere nice guy", "name": "Joe Tester", "uuid": "11111"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:21.826929]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"position": 2, "parsedtext": "Joe Testere nice guy", "name": "Bill Baloney", "uuid": "22222"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:21.829279]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"position": 2, "parsedtext": "Joe Testere nice guy", "uuid": "22222"}'
# response status: 200
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":2}
# [2013-11-22T15:32:21.830863]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:21.839080]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:22.041488]
curl -XGET 'http://127.0.0.1:9200/test-index/_search?from=0&pretty=true&size=10' -d '{"query": {"query_string": {"query": "joe"}}, "highlight": {"pre_tags": "<b>", "fields": {"parsedtext": {"order": "score"}, "name": {"order": "score"}}, "post_tags": "</b>"}}'
# response status: 200
# response body: {"took":13,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":0.22295055,"hits":[{"_index":"test-index","_type":"test-type","_id":"2","_score":0.22295055, "_source" : {"position": 2, "parsedtext": "Joe Testere nice guy", "uuid": "22222"},"highlight":{"parsedtext":["<em>Joe</em> Testere nice guy"]}},{"_index":"test-index","_type":"test-type","_id":"1","_score":0.13561106, "_source" : {"position": 1, "parsedtext": "Joe Testere nice guy", "name": "Joe Tester", "uuid": "11111"},"highlight":{"name":["<em>Joe</em> Tester"],"parsedtext":["<em>Joe</em> Testere nice guy"]}}]}}
# [2013-11-22T15:32:22.056277]
curl -XGET 'http://127.0.0.1:9200/test-index/_search?from=0&pretty=true&size=1' -d '{"query": {"query_string": {"query": "joe"}}, "highlight": {"pre_tags": "<b>", "fields": {"parsedtext": {"order": "score"}, "name": {"order": "score"}}, "post_tags": "</b>"}}'
# response status: 200
# response body: {"took":2,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":0.22295055,"hits":[{"_index":"test-index","_type":"test-type","_id":"2","_score":0.22295055, "_source" : {"position": 2, "parsedtext": "Joe Testere nice guy", "uuid": "22222"},"highlight":{"parsedtext":["<em>Joe</em> Testere nice guy"]}}]}}
# [2013-11-22T15:32:22.058941]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:22.059649]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
