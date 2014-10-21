# [2013-11-22T15:32:16.992489]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:16.993437]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:16.994130]
curl -XGET 'http://127.0.0.1:9200/_bad_request?pretty=true'
# response status: 400
# response body: No handler found for uri [/_bad_request] and method [GET]
# [2013-11-22T15:32:16.994816]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
