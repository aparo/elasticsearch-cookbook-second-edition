# [2013-11-22T15:32:19.657787]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:19.658633]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:19.681979]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "tag": {"type": "string", "store": "yes"}, "date": {"type": "date", "store": "yes"}, "position": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:19.690528]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "tag": "foo", "date": "2011-05-16T00:00:00", "position": 1, "uuid": "11111"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:19.693081]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"name": " Bill Baloney", "parsedtext": "Bill Testere nice guy", "tag": "foo", "date": "2011-04-16T00:00:00", "position": 2, "uuid": "22222"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:19.695810]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/3?pretty=true' -d '{"name": "Bill Clinton", "parsedtext": "Bill is not nice guy", "tag": "bar", "date": "2011-04-28T00:00:00", "position": 3, "uuid": "33333"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"3","_version":1}
# [2013-11-22T15:32:19.699218]
curl -XPOST 'http://127.0.0.1:9200/test-index/_refresh?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":5,"failed":0}}
# [2013-11-22T15:32:19.710620]
curl -XGET 'http://127.0.0.1:9200/_cluster/health?wait_for_status=green&timeout=0s&pretty=true'
# response status: 200
# response body: {"cluster_name":"elasticsearch","status":"yellow","timed_out":true,"number_of_nodes":1,"number_of_data_nodes":1,"active_primary_shards":12,"active_shards":12,"relocating_shards":0,"initializing_shards":0,"unassigned_shards":11}
# [2013-11-22T15:32:19.912652]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=10' -d '{"query": {"filtered": {"filter": {"range": {"date": {"to": "2011-05-01T00:00:00", "include_upper": false, "from": "2011-04-01T00:00:00"}}}, "query": {"match_all": {}}}}, "facets": {"date_facet": {"date_histogram": {"field": "date", "interval": "month"}}}}'
# response status: 200
# response body: {"took":2,"timed_out":false,"_shards":{"total":5,"successful":5,"failed":0},"hits":{"total":2,"max_score":1.0,"hits":[{"_index":"test-index","_type":"test-type","_id":"3","_score":1.0, "_source" : {"name": "Bill Clinton", "parsedtext": "Bill is not nice guy", "tag": "bar", "date": "2011-04-28T00:00:00", "position": 3, "uuid": "33333"}},{"_index":"test-index","_type":"test-type","_id":"2","_score":1.0, "_source" : {"name": " Bill Baloney", "parsedtext": "Bill Testere nice guy", "tag": "foo", "date": "2011-04-16T00:00:00", "position": 2, "uuid": "22222"}}]},"facets":{"date_facet":{"_type":"date_histogram","entries":[{"time":1301616000000,"count":2}]}}}
# [2013-11-22T15:32:19.916056]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:19.916874]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
