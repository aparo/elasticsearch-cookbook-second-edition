curl -s -XPOST 'localhost:9200/_search' -d '{
   "query" : {
      "match" : {
         "parsedtext" : {
            "operator" : "or",
            "query" : "nice guy joe",
            "type" : "boolean"
         }
      }
   },
   "rescore" : {
      "window_size" : 50,
      "query" : {
         "rescore_query" : {
            "match" : {
               "parsedtext" : {
                  "query" : "joe nice guy",
                  "type" : "phrase",
                  "slop" : 2
               }
            }
         },
         "query_weight" : 0.7,
         "rescore_query_weight" : 1.2
      }
   }
}
'
