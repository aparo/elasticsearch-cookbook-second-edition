# [2013-11-22T15:32:16.112642]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 404
# response body: 
# [2013-11-22T15:32:16.113385]
curl -XPUT 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:16.134051]
curl -XPUT 'http://127.0.0.1:9200/test-index/test-type/_mapping?pretty=true' -d '{"test-type": {"properties": {"pos": {"type": "integer", "store": "yes"}, "uuid": {"index": "not_analyzed", "boost": 1.0, "store": "yes", "type": "string"}, "parsedtext": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "name": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}, "title": {"index": "analyzed", "term_vector": "with_positions_offsets", "boost": 1.0, "store": "yes", "type": "string"}}}}'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
# [2013-11-22T15:32:16.141677]
curl -XPOST 'http://127.0.0.1:9200/_bulk?pretty=true' -d '{"delete": {"_type": "#bogus", "_id": 9, "_index": "test-index"}}
'
# response status: 200
# response body: {"took":0,"items":[{"delete":{"_index":"test-index","_type":"#bogus","_id":"9","error":"InvalidTypeNameException[mapping type name [#bogus] should not include '#' in it]"}}]}
# [2013-11-22T15:32:16.143467]
curl -XPOST 'http://127.0.0.1:9200/_bulk?pretty=true' -d '{"index": {"_type": "test-type", "_id": 8, "_index": "test-index"}}
invalid
'
# response status: 200
# response body: {"took":1,"items":[{"index":{"_index":"test-index","_type":"test-type","_id":"8","error":"MapperParsingException[failed to parse]; nested: ElasticSearchParseException[Failed to derive xcontent from (offset=68, length=7): [123, 34, 105, 110, 100, 101, 120, 34, 58, 32, 123, 34, 95, 116, 121, 112, 101, 34, 58, 32, 34, 116, 101, 115, 116, 45, 116, 121, 112, 101, 34, 44, 32, 34, 95, 105, 100, 34, 58, 32, 56, 44, 32, 34, 95, 105, 110, 100, 101, 120, 34, 58, 32, 34, 116, 101, 115, 116, 45, 105, 110, 100, 101, 120, 34, 125, 125, 10, 105, 110, 118, 97, 108, 105, 100, 10]]; "}}]}
# [2013-11-22T15:32:16.145001]
curl -XPOST 'http://127.0.0.1:9200/_bulk?pretty=true' -d '{"delete": {"_type": "#bogus", "_id": 9, "_index": "test-index"}}
'
# response status: 200
# response body: {"took":0,"items":[{"delete":{"_index":"test-index","_type":"#bogus","_id":"9","error":"InvalidTypeNameException[mapping type name [#bogus] should not include '#' in it]"}}]}
# [2013-11-22T15:32:16.146718]
curl -XPOST 'http://127.0.0.1:9200/_bulk?pretty=true' -d '{"index": {"_type": "test-type", "_id": 8, "_index": "test-index"}}
invalid
'
# response status: 200
# response body: {"took":1,"items":[{"index":{"_index":"test-index","_type":"test-type","_id":"8","error":"MapperParsingException[failed to parse]; nested: ElasticSearchParseException[Failed to derive xcontent from (offset=68, length=7): [123, 34, 105, 110, 100, 101, 120, 34, 58, 32, 123, 34, 95, 116, 121, 112, 101, 34, 58, 32, 34, 116, 101, 115, 116, 45, 116, 121, 112, 101, 34, 44, 32, 34, 95, 105, 100, 34, 58, 32, 56, 44, 32, 34, 95, 105, 110, 100, 101, 120, 34, 58, 32, 34, 116, 101, 115, 116, 45, 105, 110, 100, 101, 120, 34, 125, 125, 10, 105, 110, 118, 97, 108, 105, 100, 10]]; "}}]}
# [2013-11-22T15:32:16.148629]
curl -XHEAD 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: 
# [2013-11-22T15:32:16.149312]
curl -XDELETE 'http://127.0.0.1:9200/test-index?pretty=true'
# response status: 200
# response body: {"ok":true,"acknowledged":true}
