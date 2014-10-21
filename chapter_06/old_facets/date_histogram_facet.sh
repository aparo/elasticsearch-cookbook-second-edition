curl -XGET 'http://127.0.0.1:9200/test-index/test-type/_search?from=0&pretty=true&size=0' -d '
{
    "query": {
        "match_all": {}
    },
    "facets": {
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
        },
        "date_price": {
            "date_histogram": {
                "key_field": "date",
                "value_field": "price",
                "interval": "day"
            }
        }


    }
}'
