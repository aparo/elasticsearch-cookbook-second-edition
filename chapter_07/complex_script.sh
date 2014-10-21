curl -XPOST 'http://127.0.0.1:9200/test-index/test-type/9/_update?&pretty=true' -d '
{
  "params": {
    "new_tags": ["cool", "nice"], 
    "new_labels": ["red", "blue", "green"]
  }, 
  "lang":"groovy",
  "script": "ctx.op = \"none\";\n  if(ctx._source.containsValue(\"tags\")){\n    foreach(item:new_tags){\n      if(!ctx._source.tags.contains(item)){\n        ctx._source.tags += item;\n        ctx.op = \"index\";\n      }\n    }\n  }else{\n    ctx._source.tags=new_tags;\n    ctx.op = \"index\";\n  };\n  if(ctx._source.containsValue(\"labels\")){\n    foreach(item:new_labels){\n      if(!ctx._source.labels.contains(item)){\n        ctx._source.labels += item;\n        ctx.op = \"index\";\n      }\n    }\n  }else{\n    ctx._source.labels=new_labels;\n    ctx.op = \"index\";};"
}'
