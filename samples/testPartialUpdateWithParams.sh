# [2013-11-22T15:32:43.317691]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:43.318435]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:43.340189]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true' -d '{"counter": 0}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:43.343150]
curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/1/_update?pretty=true' -d '{"params": {"param1": 3}, "script": "ctx._source.counter = param1"}'
# response status: 200
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":2}
# [2013-11-22T15:32:43.345750]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true'
# response status: 200
# response body: {"_index":"test-index","_type":"test-type","_id":"1","_version":2,"exists":true, "_source" : {"counter":3}}
# [2013-11-22T15:32:43.347410]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:43.348750]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
