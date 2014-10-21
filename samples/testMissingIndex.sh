# [2013-11-22T15:32:17.079370]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:17.080102]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:17.080694]
curl -XPOST 'http://127.0.0.1:9200/test-index/_flush?pretty=true'
# response status: 404
# response body: {"error":"IndexMissingException[[test-index] missing]","status":404}
# [2013-11-22T15:32:17.081384]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
