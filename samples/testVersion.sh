# [2013-11-22T15:32:27.557055]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:27.558004]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:27.558702]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:27.559445]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:27.560150]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:27.581636]
curl -XPUT 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:27.602684]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true&op_type=create' -d '{"name": "Joe Test"}'
# response status: 201
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":1}
# [2013-11-22T15:32:27.605517]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true&op_type=create' -d '{"name": "Joe Test2"}'
# response status: 409
# response body: {"error":"DocumentAlreadyExistsException[[test-index][2] [test-type][1]: document already exists]","status":409}
# [2013-11-22T15:32:27.607271]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?version=1&pretty=true' -d '{"name": "Joe Test"}'
# response status: 200
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":2}
# [2013-11-22T15:32:27.609316]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?version=2&pretty=true' -d '{"name": "Joe Test"}'
# response status: 200
# response body: {"ok":true,"_index":"test-index","_type":"test-type","_id":"1","_version":3}
# [2013-11-22T15:32:27.611340]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/1?version=2&pretty=true' -d '{"name": "Joe Test2"}'
# response status: 409
# response body: {"error":"VersionConflictEngineException[[test-index][2] [test-type][1]: version conflict, current [3], provided [2]]","status":409}
# [2013-11-22T15:32:27.612991]
curl -XGET 'http://127.0.0.1:9200/test-index/test-type/1?pretty=true'
# response status: 200
# response body: {"_index":"test-index","_type":"test-type","_id":"1","_version":3,"exists":true, "_source" : {"name": "Joe Test"}}
# [2013-11-22T15:32:27.614497]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:27.615470]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:27.625642]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:27.626886]
curl -XDELETE 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:27.635986]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
