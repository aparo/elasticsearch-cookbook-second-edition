# [2013-11-22T15:32:42.138150]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:42.138803]
curl -XPUT 'http://127.0.0.1:9200/_river/text_index/_meta?pretty=true' -d '{"index": {"index": "text_index", "type": "status", "name": "text_index", "bulk_size": 100}, "twitter": {"password": "test", "user": "test"}, "type": "twitter"}'
# response status: 200
# response body: {"ok":true,"_index":"_river","_type":"text_index","_id":"_meta","_version":3}
# [2013-11-22T15:32:42.140741]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
