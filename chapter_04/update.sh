curl -XPOST http://localhost:9200/myindex/order/2qLrAfPVQvCRMe7Ku8r0Tw/_update -d '
{
 "script" : "ctx._source.in_stock_items += count",
 "params" : {
    "count" : 4
}
}'
