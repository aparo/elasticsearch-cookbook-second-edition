# [2013-11-22T15:32:43.357446]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:43.358566]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:43.383952]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"counter": 0}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:43.386232]
curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/2/_update?pretty=true' -d '{"upsert": {"counter": 5}, "script": "ctx._source.counter += 1"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"2","_version":1}
# [2013-11-22T15:32:43.393871]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/2?pretty=true'
# response status: 200
# response body: {"_index":"test-index","_type":"test-type","_id":"2","_version":1,"exists":true, "_source" : {"counter":5}}
# [2013-11-22T15:32:43.395402]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:43.396483]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
