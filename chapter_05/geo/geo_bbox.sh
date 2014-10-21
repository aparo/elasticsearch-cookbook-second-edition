curl -XGET http://127.0.0.1:9200/test-mindex/_search -d '{
    "query": {
        "filtered": {
            "filter": {
                "geo_bounding_box": {
                    "pin.location": {
                        "bottom_right": {
                            "lat": 40.03,
                            "lon": 72.0
                        },
                        "top_left": {
                            "lat": 40.717,
                            "lon": 70.99
                        }
                    }
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'
