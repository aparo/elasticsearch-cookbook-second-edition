curl -XPUT 'http://localhost:9200/myindex/order/_mapping' -d '{
    "order" : {
        "properties" : {
            "id" : {"type" : "string", "store" : "yes" , "index":"not_analyzed"},
            "date" : {"type" : "date", "store" : "no" , "index":"not_analyzed"},
            "customer_id" : {"type" : "string", "store" : "yes" , "index":"not_analyzed"},
            "sent" : {"type" : "boolean", "index":"not_analyzed"},
            "name" : {"type" : "string",  "index":"analyzed"},
            "quantity" : {"type" : "integer", "index":"not_analyzed"},
            "vat" : {"type" : "double", "index":"no"}
        }
    }
}'
