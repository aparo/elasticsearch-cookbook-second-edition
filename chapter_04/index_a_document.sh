curl -XPOST 'http://localhost:9200/myindex/order/2qLrAfPVQvCRMe7Ku8r0Tw' -d '{
    "id" : "1234",
    "date" : "2013-06-07T12:14:54",
    "customer_id" : "customer1",
    "sent" : true,
    "in_stock_items" : 0,
    "items":[
        {"name":"item1", "quantity":3, "vat":20.0},
        {"name":"item2", "quantity":2, "vat":20.0},
        {"name":"item3", "quantity":1, "vat":10.0}
    ]
}'
