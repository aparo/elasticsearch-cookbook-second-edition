import elasticsearch
from datetime import datetime

es = elasticsearch.Elasticsearch()

index_name = "my_index"
type_name = "my_type"

from utils import create_and_add_mapping

create_and_add_mapping(es, index_name, type_name)

es.index(index=index_name, doc_type=type_name, id=1,
         body={"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "uuid": "11111", "position": 1,
               "date": datetime(2013, 12, 8)})
es.index(index=index_name, doc_type=type_name + "2", id=1, body={"name": "data1", "value": "value1"}, parent=1)
es.index(index=index_name, doc_type=type_name, id=2,
         body={"name": "Bill Baloney", "parsedtext": "Bill Testere nice guy", "uuid": "22222", "position": 2,
               "date": datetime(2013, 12, 8)})
es.index(index=index_name, doc_type=type_name + "2", id=2, body={"name": "data2", "value": "value2"}, parent=2)
es.index(index=index_name, doc_type=type_name, id=3, body={"name": "Bill Clinton", "parsedtext": """Bill is not
        nice guy""", "uuid": "33333", "position": 3, "date": datetime(2013, 12, 8)})

es.update(index=index_name, doc_type=type_name, id=2, body={"script": 'ctx._source.position += 1', "lang":"groovy"})

es.delete(index=index_name, doc_type=type_name, id=3)

from elasticsearch.helpers import bulk_index
bulk_index(es, [{"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "uuid": "11111", "position": 1,
               "date": datetime(2013, 12, 8), "_index":index_name, "_type":type_name, "_id":"1"}
])

es.indices.delete(index_name)
