curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?pretty=true' -d '{"query":{"match_all":{}},
   "sort" : [
      {"price" : {"order" : "asc", "mode" : "avg", "ignore_unmapped":true, "missing":"_last"}}
   ]
}'