# [2013-11-22T15:32:25.666723]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.667390]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.667928]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.668430]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:25.668934]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.688495]
curl -XPUT 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.711440]
curl -XPUT 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.728859]
curl -XGET 'http://127.0.0.1:9200/another-index/_status?pretty=true'
# response status: 200
# response body: {"ok":true,"_shards":{"total":10,"successful":0,"failed":0},"indices":{}}
# [2013-11-22T15:32:25.729888]
curl -XDELETE 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.748951]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:25.749647]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.756249]
curl -XHEAD 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:25.757001]
curl -XDELETE 'http://127.0.0.1:9200/test-index2?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:25.763281]
curl -XHEAD 'http://127.0.0.1:9200/another-index?pretty=true'
# response status: 404
# response body: 
