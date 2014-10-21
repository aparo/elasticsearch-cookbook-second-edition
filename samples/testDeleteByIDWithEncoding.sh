# [2013-11-22T15:32:23.666432]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.667613]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.668658]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.669709]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.670440]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.706843]
curl -XPUT 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.733943]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/http%3A%2F%2Fhello%2F%3F%23%27there?pretty=true' -d '{"name": "Joe Tester"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"http://hello/?#'there","_version":1}
# [2013-11-22T15:32:23.737059]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:23.747021]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":17,"active_shards":17,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":16}
# [2013-11-22T15:32:23.949905]
curl -XDELETE 'http://127.0.0.1:9200/test-index/test-type/http%3A%2F%2Fhello%2F%3F%23%27there?pretty=true'
# response status: 200
# response body: {"ok":true,"found":true,"_index":"test-index","_type":"test-type","_id":"http://hello/?#'there","_version":2}
# [2013-11-22T15:32:23.951132]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:23.951746]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.959477]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:23.960401]
curl -XDELETE 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.967548]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
