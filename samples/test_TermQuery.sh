# [2013-11-22T15:32:15.854039]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:15.854811]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:15.863932]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:15.885624]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"attachment": {"fields": {"date": {"store": "yes"}, "title": {"store": "yes", "term_vector": "with_positions_offsets"}, "attachment": {"store": "yes"}, "file": {"store": "yes"}, "author": {"store": "yes"}}, "type": "attachment"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 400
# response body: {"error":"MapperParsingException[No handler for type [attachment] declared on field [attachment]]","status":400}
2:42.497520]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"position": 1, "inserted": "2010-10-22T12:12:12", "parsedtext": "Joe Testere nice guy", "name": "Joe Tester", "uuid": "11111"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:42.500064]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"position": 2, "inserted": "2010-10-22T12:12:10", "parsedtext": "Joe Testere nice guy", "name": "Bill Baloney", "uuid": "22222"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:42.502964]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/3?pretty=true' -d '{"position": 3, "inserted": "0001-01-01T00:00:00", "parsedtext": "Bible guy", "name": "Jesus H Christ", "uuid": "33333"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"3","_version":1}
# [2013-11-22T15:32:42.505694]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:42.514076]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:42.716156]
curl -XGET 'http://127.0.0.1:9200/test-index/_search?from=0&pretty=true&size=10' -d '{"query": {"term": {"name": "joe"}}}'
# response status: 200
# response body: {"took":1,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":0.19178301,"hits":[{"_index":"test-index","_type":"test-type","_id":"1","_score":0.19178301, "_source" : {"position": 1, "inserted": "2010-10-22T12:12:12", "parsedtext": "Joe Testere nice guy", "name": "Joe Tester", "uuid": "11111"}}]}}
# [2013-11-22T15:32:42.718100]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:42.718750]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
