# [2013-11-22T15:32:17.039462]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:17.040264]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:17.041222]
curl -XDELETE 'http://127.0.0.1:9200/test-index/flibble/asdf?pretty=true'
# response status: 404
# response body: {"ok":true,"found":false,"_index":"test-index","_type":"flibble","_id":"asdf","_version":1}
# [2013-11-22T15:32:17.071712]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:17.072427]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
