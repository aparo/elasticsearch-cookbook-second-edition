curl -XGET http://127.0.0.1:9200/test-mindex/_search -d '{
    "query": {
        "filtered": {
            "filter": {
                "geo_distance": {
                    "pin.location": {
                        "lat": 40,
                        "lon": 70
                    },
                    "distance": "200km",
                    "optimize_bbox": "memory"
                }
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'

curl -XGET http://127.0.0.1:9200/test-mindex/_search -d '{
    "query": {
        "filtered": {
            "filter": {
                "geo_distance_range": {
                    "pin.location": {
                        "lat": 40,
                        "lon": 70
                    },
                    "to": "200km",
                    "optimize_bbox": "memory"
}
            },
            "query": {
                "match_all": {}
            }
        }
    }
}'



