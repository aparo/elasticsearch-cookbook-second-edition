# [2013-11-22T15:32:17.082402]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:17.083416]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:17.084133]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true' -d '{"mappings": {"test-type": {"_type": {"store": "yes"}, "type": "object", "properties": {"uuid": {"index": "not_analyzed", "type": "string", "store": "yes"}, "title": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}, "parsedtext": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}, "nested": {"type": "nested", "properties": {"num": {"index": "not_analyzed", "type": "integer", "store": "yes"}, "name": {"index": "not_analyzed", "type": "string", "store": "yes"}, "value": {"index": "not_analyzed", "type": "string", "store": "yes"}}}, "date": {"index": "not_analyzed", "type": "date", "store": "yes"}, "position": {"index": "not_analyzed", "type": "integer", "store": "yes"}, "name": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}}}}, "settings": {"index.number_of_replicas": 1, "index.number_of_shards": 5}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:17.107661]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":4,"failed":0}}
# [2013-11-22T15:32:18.110417]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:18.111708]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:18.112445]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
