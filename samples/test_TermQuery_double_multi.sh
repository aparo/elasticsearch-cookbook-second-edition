# [2013-11-22T15:32:27.935871]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:27.936785]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:27.960700]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:27.969991]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"name": "Joe Tester", "title": "Joe Testere nice guy"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:27.973048]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true' -d '{"name": "Bill Baloney", "title": "Bill Testere nice guy"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:27.976007]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/3?pretty=true' -d '{"name": "Bill Clinton", "title": "Bill is not\n                nice guy"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"3","_version":1}
