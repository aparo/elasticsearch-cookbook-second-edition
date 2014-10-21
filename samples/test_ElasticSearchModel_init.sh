# [2013-11-22T15:32:18.119670]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:18.120707]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:18.121522]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true' -d '{"mappings": {"test-type": {"_type": {"store": "yes"}, "type": "object", "properties": {"uuid": {"index": "not_analyzed", "type": "string", "store": "yes"}, "title": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}, "parsedtext": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}, "nested": {"type": "nested", "properties": {"num": {"index": "not_analyzed", "type": "integer", "store": "yes"}, "name": {"index": "not_analyzed", "type": "string", "store": "yes"}, "value": {"index": "not_analyzed", "type": "string", "store": "yes"}}}, "date": {"index": "not_analyzed", "type": "date", "store": "yes"}, "position": {"index": "not_analyzed", "type": "integer", "store": "yes"}, "name": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}}}}, "settings": {"index.number_of_replicas": 1, "index.number_of_shards": 5}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:18.144633]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":4,"failed":0}}
# [2013-11-22T15:32:19.146834]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:19.348582]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/dasdas?pretty=true' -d '{"name": "aaa", "val": 1}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"dasdas","_version":1}
# [2013-11-22T15:32:19.351747]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/dasdas?version=1&pretty=true' -d '{"name": "test2", "val": 1}'
# response status: 200
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"dasdas","_version":2}
# [2013-11-22T15:32:19.353346]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/dasdas?pretty=true'
# response status: 200
# response body: {"_index":"test-index","_type":"test-type","_id":"dasdas","_version":2,"exists":true, "_source" : {"name": "test2", "val": 1}}
# [2013-11-22T15:32:19.354362]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:19.355126]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
