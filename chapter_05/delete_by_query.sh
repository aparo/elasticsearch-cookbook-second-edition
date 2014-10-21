curl -XDELETE 'http://127.0.0.1:9200/test-index/test-type/_query?pretty=true' -d '{"match_all":{}}'
curl -XDELETE 'http://127.0.0.1:9200/test-index/test-type/_query?pretty=true&q=uuid:11111'


