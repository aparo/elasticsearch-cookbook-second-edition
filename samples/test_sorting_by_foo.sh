# [2013-11-22T15:32:42.729037]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:42.729765]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:42.751022]
curl -XPUT 'http://127.0.0.1:9200/_all/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"location": {"type": "geo_point"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:42.762139]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"foo": 1, "location": {"lat": 1, "lon": 1}}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:42.764295]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"foo": 2, "location": {"lat": 2, "lon": 2}}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:42.766092]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/3?pretty=true' -d '{"foo": 3, "location": {"lat": 3, "lon": 3}}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"3","_version":1}
# [2013-11-22T15:32:42.767685]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:42.776331]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:42.778018]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"sort": [{"foo": {"order": "desc"}}], "query": {"match_all": {}}}'
# response status: 200
# response body: {"took":1,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":3,"max_score":null,"hits":[{"_index":"test-index","_type":"test-type","_id":"3","_score":null, "_source" : {"foo": 3, "location": {"lat": 3, "lon": 3}},"sort":[3]},{"_index":"test-index","_type":"test-type","_id":"2","_score":null, "_source" : {"foo": 2, "location": {"lat": 2, "lon": 2}},"sort":[2]},{"_index":"test-index","_type":"test-type","_id":"1","_score":null, "_source" : {"foo": 1, "location": {"lat": 1, "lon": 1}},"sort":[1]}]}}
# [2013-11-22T15:32:42.781152]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:42.782420]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
