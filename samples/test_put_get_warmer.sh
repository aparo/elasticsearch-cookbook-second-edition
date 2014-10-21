# [2013-11-22T15:32:43.695933]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:43.697211]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:43.720572]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":4,"failed":0}}
# [2013-11-22T15:32:43.721743]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:43.923474]
curl -XPOST 'http://127.0.0.1:9200/test-index/test-type?pretty=true' -d '{"a": 1}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"C85gXrLBTnCjHln96ypmQA","_version":1}
# [2013-11-22T15:32:43.925909]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:43.931694]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:44.133305]
curl -XPUT 'http://127.0.0.1:9200/test-index/_warmer/w1?pretty=true' -d '{"query": {"match_all": {}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:44.136142]
curl -XGET 'http://127.0.0.1:9200/test-index/_warmer/w1?pretty=true'
# response status: 200
# response body: {"test-index":{"warmers":{"w1":{"types":[],"source":{"query":{"match_all":{}}}}}}}
# [2013-11-22T15:32:44.137501]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:44.138455]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
