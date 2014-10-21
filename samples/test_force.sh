# [2013-11-22T15:32:16.058610]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:16.059411]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:16.079482]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"pos": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:16.088736]
curl -XPOST 'http://127.0.0.1:9200/_bulk?pretty=true' -d '{"index": {"_type": "test-type", "_id": 1, "_index": "test-index"}}
{"position": 1, "parsedtext": "Joe Testere nice guy", "name": "Joe Tester", "uuid": "11111"}
{"index": {"_type": "test-type", "_id": 2, "_index": "test-index"}}
{"position": 2, "parsedtext": "Bill Testere nice guy", "name": "Bill Baloney", "uuid": "22222"}
{"index": {"_type": "test-type", "_id": 3, "_index": "test-index"}}
{"position": 3, "parsedtext": "Bill is not\n                nice guy", "name": "Bill Clinton", "uuid": "33333"}
'
# response status: 200
# response body: {"took":2,"items":[{"index":{"_index":"test-index","_type":"test-type","_id":"1","_version":1,"ok":true}},{"index":{"_index":"test-index","_type":"test-type","_id":"2","_version":1,"ok":true}},{"index":{"_index":"test-index","_type":"test-type","_id":"3","_version":1,"ok":true}}]}
# [2013-11-22T15:32:16.092150]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:16.100574]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:16.101583]
curl -XGET 'http://127.0.0.1:9200/test-index/_search?from=0&pretty=true&size=10' -d '{"query": {"term": {"name": "bill"}}}'
# response status: 200
# response body: {"took":0,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":0.19178301,"hits":[{"_index":"test-index","_type":"test-type","_id":"3","_score":0.19178301, "_source" : {"position": 3, "parsedtext": "Bill is not\n                nice guy", "name": "Bill Clinton", "uuid": "33333"}},{"_index":"test-index","_type":"test-type","_id":"2","_score":0.19178301, "_source" : {"position": 2, "parsedtext": "Bill Testere nice guy", "name": "Bill Baloney", "uuid": "22222"}}]}}
# [2013-11-22T15:32:16.103479]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:16.104151]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
