from pyes import ES

es = ES()

index_name = "my_index"
type_name = "my_type"

from utils_pyes import create_and_add_mapping

create_and_add_mapping(es, index_name, type_name)

es.index(doc={"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "uuid": "11111", "position": 1},
         index=index_name, doc_type=type_name, id=1)
es.index(doc={"name": "data1", "value": "value1"}, index=index_name, doc_type=type_name + "2", id=1, parent=1)
es.index(doc={"name": "Bill Baloney", "parsedtext": "Bill Testere nice guy", "uuid": "22222", "position": 2},
         index=index_name, doc_type=type_name, id=2, bulk=True)
es.index(doc={"name": "data2", "value": "value2"}, index=index_name, doc_type=type_name + "2", id=2, parent=2,
         bulk=True)
es.index(doc={"name": "Bill Clinton", "parsedtext": """Bill is not
        nice guy""", "uuid": "33333", "position": 3}, index=index_name, doc_type=type_name, id=3, bulk=True)

es.force_bulk()

es.update(index=index_name, doc_type=type_name, id=2, script='ctx._source.position += 1')
es.update(index=index_name, doc_type=type_name, id=2, script='ctx._source.position += 1', bulk=True)

es.delete(index=index_name, doc_type=type_name, id=1, bulk=True)
es.delete(index=index_name, doc_type=type_name, id=3)

es.force_bulk()
es.indices.refresh(index_name)

es.indices.delete_index(index_name)