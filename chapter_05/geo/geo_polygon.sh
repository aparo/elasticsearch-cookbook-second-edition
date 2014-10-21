curl -XGET http://127.0.0.1:9200/test-mindex/_search -d '{
    "query": {
        "filtered": {
            "filter": {
                "geo_bounding_box": {
                    "pin.location": {
                        "points": [
                            {
                                "lat": 50,
                                "lon": -30
                            },
                            {
                                "lat": 30,
                                "lon": -80
                            },
                            {
                                "lat": 80,
                                "lon": -90
                            }
                        ]
                    }
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'
