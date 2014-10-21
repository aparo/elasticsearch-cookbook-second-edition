# [2013-11-22T15:32:42.133222]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:42.133952]
curl -XPUT 'http://127.0.0.1:9200/_river/text_index/_meta?pretty=true' -d '{"index": {"index": "text_index", "type": "test_type", "name": "text_index", "bulk_size": 100}, "type": "rabbitmq", "rabbitmq": {"queue_durable": true, "exchange": "es", "queue_auto_delete": false, "vhost": "/", "host": "localhost", "user": "guest", "pass": "guest", "exchange_durable": true, "port": 5672, "exchange_declare": true, "queue_bind": true, "routing_key": "es", "exchange_type": "direct", "queue": "es", "queue_declare": true}}'
# response status: 200
# response body: {"ok":true,"_index":"_river","_type":"text_index","_id":"_meta","_version":2}
# [2013-11-22T15:32:42.137145]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
