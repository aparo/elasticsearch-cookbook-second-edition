# [2013-11-22T15:32:28.998470]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:28.999276]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:29.036212]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"nested1": {"type": "nested"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:29.045140]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"field1": "value1", "nested1": [{"n_field1": "n_value1_1", "n_field2": "n_value2_1"}, {"n_field1": "n_value1_2", "n_field2": "n_value2_2"}]}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:29.048371]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"field1": "value1", "nested1": [{"n_field1": "n_value1_1", "n_field2": "n_value2_2"}, {"n_field1": "n_value1_2", "n_field2": "n_value2_1"}]}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:29.051252]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:29.059651]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:29.261299]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"term": {"_all": "n_value1_1"}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":1,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":1.0,"hits":[{"_index":"test-index","_type":"test-type","_id":"1","_score":1.0, "_source" : {"field1": "value1", "nested1": [{"n_field1": "n_value1_1", "n_field2": "n_value2_1"}, {"n_field1": "n_value1_2", "n_field2": "n_value2_2"}]}},{"_index":"test-index","_type":"test-type","_id":"2","_score":1.0, "_source" : {"field1": "value1", "nested1": [{"n_field1": "n_value1_1", "n_field2": "n_value2_2"}, {"n_field1": "n_value1_2", "n_field2": "n_value2_1"}]}}]}}
# [2013-11-22T15:32:29.263732]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"term": {"nested1.n_field1": "n_value1_1"}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":0,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":0,"max_score":null,"hits":[]}}
# [2013-11-22T15:32:29.265547]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"term": {"nested1.n_field1": "n_value1_1"}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":0,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":0,"max_score":null,"hits":[]}}
# [2013-11-22T15:32:29.267436]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"nested": {"path": "nested1", "query": {"bool": {"must": [{"term": {"nested1.n_field1": "n_value1_1"}}]}}}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":5,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":1.0,"hits":[{"_index":"test-index","_type":"test-type","_id":"1","_score":1.0, "_source" : {"field1": "value1", "nested1": [{"n_field1": "n_value1_1", "n_field2": "n_value2_1"}, {"n_field1": "n_value1_2", "n_field2": "n_value2_2"}]}},{"_index":"test-index","_type":"test-type","_id":"2","_score":1.0, "_source" : {"field1": "value1", "nested1": [{"n_field1": "n_value1_1", "n_field2": "n_value2_2"}, {"n_field1": "n_value1_2", "n_field2": "n_value2_1"}]}}]}}
# [2013-11-22T15:32:29.273479]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"nested": {"path": "nested1", "query": {"bool": {"must": [{"term": {"nested1.n_field1": "n_value1_1"}}, {"term": {"nested1.n_field2": "n_value2_1"}}]}}}}, "query": {"match_all": {}}}}}'
# response status: 200
# response body: {"took":1,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":1,"max_score":1.0,"hits":[{"_index":"test-index","_type":"test-type","_id":"1","_score":1.0, "_source" : {"field1": "value1", "nested1": [{"n_field1": "n_value1_1", "n_field2": "n_value2_1"}, {"n_field1": "n_value1_2", "n_field2": "n_value2_2"}]}}]}}
# [2013-11-22T15:32:29.276017]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:29.276786]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
