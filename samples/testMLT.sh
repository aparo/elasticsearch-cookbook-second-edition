# [2013-11-22T15:32:25.922638]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.923283]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.923834]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.924342]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.924870]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.952067]
curl -XPUT 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.975140]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"name": "Joe Test"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:25.978502]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"name": "Joe Tester"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:25.996256]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/3?pretty=true' -d '{"name": "Joe did the test"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"3","_version":1}
# [2013-11-22T15:32:25.999188]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:26.009250]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":17,"active_shards":17,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":16}
# [2013-11-22T15:32:26.711181]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/1/_mlt?min_doc_freq=1&fields=name&pretty=true&min_term_freq=1'
# response status: 200
# response body: {"took":1,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":0.2169777,"hits":[{"_index":"test-index","_type":"test-type","_id":"3","_score":0.2169777, "_source" : {"name": "Joe did the test"}},{"_index":"test-index","_type":"test-type","_id":"2","_score":0.19178301, "_source" : {"name": "Joe Tester"}}]}}
# [2013-11-22T15:32:26.714707]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:26.715484]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:26.725956]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:26.726779]
curl -XDELETE 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:26.734236]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
