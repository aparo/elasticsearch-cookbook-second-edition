# [2013-11-22T15:32:24.088653]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:24.089286]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:24.089824]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:24.090332]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:24.090883]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:24.111200]
curl -XPUT 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:24.135391]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"name": "Joe Tester"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:24.137850]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/http%3A%2F%2Fexample.com?pretty=true' -d '{"name": "Bill Baloney"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"http://example.com","_version":1}
# [2013-11-22T15:32:24.151066]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:24.160257]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":17,"active_shards":17,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":16}
# [2013-11-22T15:32:24.362752]
curl -XHEAD 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:24.363650]
curl -XHEAD 'http://127.0.0.1:9200/test-index/test-type/http%3A%2F%2Fexample.com?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:24.364230]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:24.364871]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:24.372888]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:24.373633]
curl -XDELETE 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:24.380241]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
