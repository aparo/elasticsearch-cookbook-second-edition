# [2013-11-22T15:32:20.730434]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:20.731414]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:20.755819]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "tag": {"type": "string", "store": "yes"}, "date": {"type": "date", "store": "yes"}, "position": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:20.765795]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "tag": "foo", "date": "2011-05-16T00:00:00", "position": 1, "uuid": "11111"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:20.768705]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"name": " Bill Baloney", "parsedtext": "Bill Testere nice guy", "tag": "foo", "date": "2011-04-16T00:00:00", "position": 2, "uuid": "22222"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:20.771311]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/3?pretty=true' -d '{"name": "Bill Clinton", "parsedtext": "Bill is not nice guy", "tag": "bar", "date": "2011-04-28T00:00:00", "position": 3, "uuid": "33333"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"3","_version":1}
# [2013-11-22T15:32:20.774029]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:20.785114]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:20.986723]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"term": {"tag": "foo"}}, "query": {"match_all": {}}}}, "facets": {"tag": {"terms": {"field": "tag", "size": 10}}}}'
# response status: 200
# response body: {"took":1,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":1.0,"hits":[{"_index":"test-index","_type":"test-type","_id":"1","_score":1.0, "_source" : {"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "tag": "foo", "date": "2011-05-16T00:00:00", "position": 1, "uuid": "11111"}},{"_index":"test-index","_type":"test-type","_id":"2","_score":1.0, "_source" : {"name": " Bill Baloney", "parsedtext": "Bill Testere nice guy", "tag": "foo", "date": "2011-04-16T00:00:00", "position": 2, "uuid": "22222"}}]},"facets":{"tag":{"_type":"terms","missing":0,"total":2,"other":0,"terms":[{"term":"foo","count":2}]}}}
# [2013-11-22T15:32:20.989370]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:20.990128]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
