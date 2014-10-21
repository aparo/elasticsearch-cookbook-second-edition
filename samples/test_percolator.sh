# [2013-11-22T15:32:29.610659]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:29.611394]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:29.631996]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"pos": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:29.643565]
curl -XPUT 'http://127.0.0.1:9200/_percolator/test-index/test-perc1?pretty=true' -d '{"query": {"query_string": {"fields": ["_all"], "query": "apple"}}}'
# response status: 200
# response body: {"ok":true,"_index":"_percolator","_type":"test-index","_id":"test-perc1","_version":5}
# [2013-11-22T15:32:29.646905]
curl -XPUT 'http://127.0.0.1:9200/_percolator/test-index/test-perc2?pretty=true' -d '{"query": {"query_string": {"fields": ["_all"], "query": "apple OR iphone"}}}'
# response status: 200
# response body: {"ok":true,"_index":"_percolator","_type":"test-index","_id":"test-perc2","_version":5}
# [2013-11-22T15:32:29.648863]
curl -XPUT 'http://127.0.0.1:9200/_percolator/test-index/test-perc3?pretty=true' -d '{"query": {"query_string": {"fields": ["_all"], "query": "apple AND iphone"}}}'
# response status: 200
# response body: {"ok":true,"_index":"_percolator","_type":"test-index","_id":"test-perc3","_version":5}
# [2013-11-22T15:32:29.650794]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:29.651931]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:29.854187]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_percolate?pretty=true' -d '{"doc": {"name": "iphone"}}'
# response status: 200
# response body: {"ok":true,"matches":["test-perc2"]}
# [2013-11-22T15:32:29.856445]
curl -XDELETE 'http://127.0.0.1:9200/_percolator/test-index/test-perc1?pretty=true'
# response status: 200
# response body: {"ok":true,"found":true,"_index":"_percolator","_type":"test-index","_id":"test-perc1","_version":6}
# [2013-11-22T15:32:29.857398]
curl -XDELETE 'http://127.0.0.1:9200/_percolator/test-index/test-perc2?pretty=true'
# response status: 200
# response body: {"ok":true,"found":true,"_index":"_percolator","_type":"test-index","_id":"test-perc2","_version":6}
# [2013-11-22T15:32:29.858171]
curl -XDELETE 'http://127.0.0.1:9200/_percolator/test-index/test-perc3?pretty=true'
# response status: 200
# response body: {"ok":true,"found":true,"_index":"_percolator","_type":"test-index","_id":"test-perc3","_version":6}
# [2013-11-22T15:32:29.858879]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:29.859450]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
