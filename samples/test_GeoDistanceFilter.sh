# [2013-11-22T15:32:21.265637]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:21.266596]
curl -XHEAD 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:21.267204]
curl -XPUT 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:21.288498]
curl -XPUT 'http://127.0.0.1:9200/test-mindex/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"pin": {"properties": {"location": {"type": "geo_point"}}}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:21.297219]
curl -XPUT 'http://127.0.0.1:9200/test-mindex/test-type/1?pretty=true' -d '{"pin": {"location": {"lat": 40.12, "lon": -71.34}}}'
# response status: 201
# response body: {"ok":true,"_index":"test-mindex","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:21.299510]
curl -XPUT 'http://127.0.0.1:9200/test-mindex/test-type/2?pretty=true' -d '{"pin": {"location": {"lat": 40.12, "lon": 71.34}}}'
# response status: 201
# response body: {"ok":true,"_index":"test-mindex","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:21.311538]
curl -XPOST 'http://127.0.0.1:9200/test-mindex/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:21.318473]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:21.520873]
curl -XGET 'http://127.0.0.1:9200/test-mindex/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"geo_distance": {"pin.location": {"lat": 40, "lon": 70}, "distance": "200km", "optimize_bbox": "memory"}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":3,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"test-mindex","_type":"test-type","_id":"2","_score":1.0, "_source" : {"pin": {"location": {"lat": 40.12, "lon": 71.34}}}}]}}
# [2013-11-22T15:32:21.524863]
curl -XGET 'http://127.0.0.1:9200/test-mindex/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"geo_distance": {"pin.location": [70, 40], "distance": "200km", "optimize_bbox": "memory"}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":0,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"test-mindex","_type":"test-type","_id":"2","_score":1.0, "_source" : {"pin": {"location": {"lat": 40.12, "lon": 71.34}}}}]}}
# [2013-11-22T15:32:21.526562]
curl -XHEAD 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:21.527184]
curl -XDELETE 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
