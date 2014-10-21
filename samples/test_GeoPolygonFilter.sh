# [2013-11-22T15:32:21.534981]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:21.535701]
curl -XHEAD 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:21.536273]
curl -XPUT 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:21.559468]
curl -XPUT 'http://127.0.0.1:9200/test-mindex/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"pin": {"properties": {"location": {"type": "geo_point"}}}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:21.567814]
curl -XPUT 'http://127.0.0.1:9200/test-mindex/test-type/1?pretty=true' -d '{"pin": {"location": {"lat": 40.12, "lon": -71.34}}}'
# response status: 201
# response body: {"ok":true,"_index":"test-mindex","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:21.569809]
curl -XPUT 'http://127.0.0.1:9200/test-mindex/test-type/2?pretty=true' -d '{"pin": {"location": {"lat": 40.12, "lon": 71.34}}}'
# response status: 201
# response body: {"ok":true,"_index":"test-mindex","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:21.571753]
curl -XPOST 'http://127.0.0.1:9200/test-mindex/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:21.578608]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:21.781152]
curl -XGET 'http://127.0.0.1:9200/test-mindex/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"geo_polygon": {"pin.location": {"points": [{"lat": 50, "lon": -30}, {"lat": 30, "lon": -80}, {"lat": 80, "lon": -90}]}}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":2,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"test-mindex","_type":"test-type","_id":"1","_score":1.0, "_source" : {"pin": {"location": {"lat": 40.12, "lon": -71.34}}}}]}}
# [2013-11-22T15:32:21.784119]
curl -XGET 'http://127.0.0.1:9200/test-mindex/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"geo_polygon": {"pin.location": {"points": [[-30, 50], [-80, 30], [-90, 80]]}}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":1,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"test-mindex","_type":"test-type","_id":"1","_score":1.0, "_source" : {"pin": {"location": {"lat": 40.12, "lon": -71.34}}}}]}}
# [2013-11-22T15:32:21.785972]
curl -XHEAD 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:21.786598]
curl -XDELETE 'http://127.0.0.1:9200/test-mindex?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
