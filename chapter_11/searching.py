import elasticsearch
from pprint import pprint

es = elasticsearch.Elasticsearch()
index_name = "my_index"
type_name = "my_type"

from utils import create_and_add_mapping, populate

create_and_add_mapping(es, index_name, type_name)
populate(es, index_name, type_name)

results = es.search(index_name, type_name, {"query": {"match_all": {}}})
pprint(results)

results = es.search(index_name, type_name, {
        "query": {
            "term": {"name": {"boost": 3.0, "value": "joe"}}}
    })
pprint(results)

results = es.search(index_name, type_name, {"query": {
    "filtered": {
        "filter": {
            "or": [
                {"term": {"position": 1}},
                {"term": {"position": 2}}]
        },
        "query": {"match_all": {}}}}})
pprint(results)

es.indices.delete(index_name)
