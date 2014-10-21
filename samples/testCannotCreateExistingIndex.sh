# [2013-11-22T15:32:23.187175]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.187967]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.188578]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.189150]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:23.189860]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.211837]
curl -XPUT 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.245543]
curl -XPUT 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.260860]
curl -XPUT 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 400
# response body: {"error":"IndexAlreadyExistsException[[another-index] already exists]","status":400}
# [2013-11-22T15:32:23.281795]
curl -XDELETE 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.292871]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:23.293534]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.300098]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:23.300814]
curl -XDELETE 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:23.307299]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
