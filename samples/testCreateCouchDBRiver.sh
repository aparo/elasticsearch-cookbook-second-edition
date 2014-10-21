# [2013-11-22T15:32:42.128840]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:42.129746]
curl -XPUT 'http://127.0.0.1:9200/_river/text_index/_meta?pretty=true' -d '{"couchdb": {"filter": null, "host": "localhost", "db": "mydb", "port": 5984}, "type": "couchdb"}'
# response status: 201
# response body: {"ok":true,"_index":"_river","_type":"text_index","_id":"_meta","_version":1}
# [2013-11-22T15:32:42.132228]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
