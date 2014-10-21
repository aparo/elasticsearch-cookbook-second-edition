# [2013-11-22T15:32:15.933496]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:15.934413]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:15.941317]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:15.961943]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"my_attachment": {"fields": {"date": {"store": "yes"}, "title": {"store": "yes"}, "file": {"store": "yes"}, "author": {"store": "yes"}}, "type": "attachment"}}}}'
# response status: 400
# response body: {"error":"MapperParsingException[No handler for type [attachment] declared on field [my_attachment]]","status":400}
# [2013-11-22T15:32:15.969781]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:15.970507]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
