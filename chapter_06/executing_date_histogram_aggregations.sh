curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=0' -d '
{
    "query": {
        "match_all": {}
    },
    "aggs": {
        "date_year": {
            "date_histogram": {
                "field": "date",
                "interval": "year"
            }
        },
        "date_quarter": {
            "date_histogram": {
                "field": "date",
                "interval": "quarter",
                "time_zone": "+01:00"
            }
        }


    }
}'
