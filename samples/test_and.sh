# [2013-11-22T15:32:29.285072]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:29.285996]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:29.309281]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"pos": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:29.318234]
curl -XPUT 'http://127.0.0.1:9200/_percolator/test-index/test-perc1?pretty=true' -d '{"query": {"query_string": {"fields": ["_all"], "query": "apple"}}}'
# response status: 201
# response body: {"ok":true,"_index":"_percolator","_type":"test-index","_id":"test-perc1","_version":1}
# [2013-11-22T15:32:29.321863]
curl -XPUT 'http://127.0.0.1:9200/_percolator/test-index/test-perc2?pretty=true' -d '{"query": {"query_string": {"fields": ["_all"], "query": "apple OR iphone"}}}'
# response status: 201
# response body: {"ok":true,"_index":"_percolator","_type":"test-index","_id":"test-perc2","_version":1}
# [2013-11-22T15:32:29.324002]
curl -XPUT 'http://127.0.0.1:9200/_percolator/test-index/test-perc3?pretty=true' -d '{"query": {"query_string": {"fields": ["_all"], "query": "apple AND iphone"}}}'
# response status: 201
# response body: {"ok":true,"_index":"_percolator","_type":"test-index","_id":"test-perc3","_version":1}
# [2013-11-22T15:32:29.325880]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:29.327071]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:29.529230]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_percolate?pretty=true' -d '{"doc": {"name": "apple iphone"}}'
# response status: 200
# response body: {"ok":true,"matches":["test-perc2","test-perc1","test-perc3"]}
# [2013-11-22T15:32:29.531408]
curl -XDELETE 'http://127.0.0.1:9200/_percolator/test-index/test-perc1?pretty=true'
# response status: 200
# response body: {"ok":true,"found":true,"_index":"_percolator","_type":"test-index","_id":"test-perc1","_version":2}
# [2013-11-22T15:32:29.532836]
curl -XDELETE 'http://127.0.0.1:9200/_percolator/test-index/test-perc2?pretty=true'
# response status: 200
# response body: {"ok":true,"found":true,"_index":"_percolator","_type":"test-index","_id":"test-perc2","_version":2}
# [2013-11-22T15:32:29.534120]
curl -XDELETE 'http://127.0.0.1:9200/_percolator/test-index/test-perc3?pretty=true'
# response status: 200
# response body: {"ok":true,"found":true,"_index":"_percolator","_type":"test-index","_id":"test-perc3","_version":2}
# [2013-11-22T15:32:29.534940]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:29.535643]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
