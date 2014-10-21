curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/9/_update?&pretty=true' -d '{
    "script" : "ctx._source.tag += tag",
    "params" : {
        "tag" : "cool"
    }
}'


