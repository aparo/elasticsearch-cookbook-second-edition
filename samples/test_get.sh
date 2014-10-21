# [2013-11-22T15:32:37.603797]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:37.605069]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:37.605778]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true' -d '{"mappings": {"test-type": {"_type": {"store": "yes"}, "type": "object", "properties": {"uuid": {"index": "not_analyzed", "type": "string", "store": "yes"}, "title": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}, "parsedtext": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}, "nested": {"type": "nested", "properties": {"num": {"index": "not_analyzed", "type": "integer", "store": "yes"}, "name": {"index": "not_analyzed", "type": "string", "store": "yes"}, "value": {"index": "not_analyzed", "type": "string", "store": "yes"}}}, "date": {"index": "not_analyzed", "type": "date", "store": "yes"}, "position": {"index": "not_analyzed", "type": "integer", "store": "yes"}, "name": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}}}}, "settings": {"index.number_of_replicas": 1, "index.number_of_shards": 5}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:37.628061]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":4,"failed":0}}
# [2013-11-22T15:32:38.630019]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:38.832480]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"date": "2012-09-01T12:34:33", "position": 1, "parsedtext": "Joe Testere nice guy", "name": ["Joe Tester", "J. Tester"], "uuid": "11111"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:38.834966]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type2/1?parent=1&pretty=true' -d '{"name": "data1", "value": "value1"}'
# response status: 400
# response body: {"error":"ElasticSearchIllegalArgumentException[Can't specify parent if no parent field has been configured]","status":400}
