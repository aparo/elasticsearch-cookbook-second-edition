# [2013-11-22T15:32:43.450643]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:43.451386]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:43.474190]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":4,"failed":0}}
# [2013-11-22T15:32:43.476546]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:43.678412]
curl -XPUT 'http://127.0.0.1:9200/test-index/_warmer/w1?pretty=true' -d '{"query": {"match_all": {}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:43.682420]
curl -XDELETE 'http://127.0.0.1:9200/test-index/_warmer/w1?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:43.685411]
curl -XGET 'http://127.0.0.1:9200/test-index/_warmer/w1?pretty=true'
# response status: 404
# response body: {"error":"IndexWarmerMissingException[index_warmer [w1] missing]","status":404}
# [2013-11-22T15:32:43.687368]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:43.687985]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
