curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/9/_update?&pretty=true' -d '{
    "script" : "ctx._source.tag += tag",
    "params" : {
        "tag" : "cool"
    }
}'


curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/9/_update?&pretty=true' -d '{
    "script" : "ctx._source.tag += tag",
    "lang":"js",
    "params" : {
        "tag" : "cool"
    }
}'


curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/8/_update?&pretty=true' -d '{
    "script" : "ctx[\"_source\"][\"tag\"] = list(ctx[\"_source\"][\"tag\"]) + [tag]",
    "lang":"python",
    "params" : {
        "tag" : "cool"
    }
}'

