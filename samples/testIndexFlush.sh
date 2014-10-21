# [2013-11-22T15:32:25.094829]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.095527]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.096090]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.096617]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.097133]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.121556]
curl -XPUT 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.147034]
curl -XPUT 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.166334]
curl -XPOST 'http://127.0.0.1:9200/another-index/_flush?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":0,"failed":0}}
# [2013-11-22T15:32:25.167816]
curl -XDELETE 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.199138]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:25.200825]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.212074]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:25.213083]
curl -XDELETE 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.221330]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
