__author__ = 'alberto'
from datetime import datetime


def create_and_add_mapping(connection, index_name, type_name):
    try:
        connection.indices.create(index_name)
    except:
        # we skip exception if index already exists
        pass
    connection.cluster.health(wait_for_status="yellow")
    connection.indices.put_mapping(index=index_name, doc_type=type_name, body={type_name: {"properties": {
        "uuid": {"index": "not_analyzed", "type": "string", "store": "yes"},
        "title": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"},
        "parsedtext": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"},
        "nested": {"type": "nested", "properties": {"num": {"index": "not_analyzed", "type": "integer", "store": "yes"},
                                                    "name": {"index": "not_analyzed", "type": "string", "store": "yes"},
                                                    "value": {"index": "not_analyzed", "type": "string",
                                                              "store": "yes"}}},
        "date": {"index": "not_analyzed", "type": "date", "store": "yes"},
        "position": {"index": "not_analyzed", "type": "integer", "store": "yes"},
        "name": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}}}})
    type2 = type_name + "2"
    connection.indices.put_mapping(index=index_name, doc_type=type2, body={type2: {
        "_parent": {
            "type": "my_type"
        },
        "_routing": {
            "required": True
        },
        "_type": {
            "store": True
        },
        "properties": {
            "name": {
                "type": "string"
            },
            "value": {
                "type": "string"
            }
        }
    }})

def populate(connection, index_name, type_name):
    connection.index(index=index_name, doc_type=type_name, id=1,
                     body={"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "uuid": "11111",
                           "position": 1,
                           "date": datetime(2013, 12, 8)})
    connection.index(index=index_name, doc_type=type_name + "2", id=1, body={"name": "data1", "value": "value1"},
                     parent=1)
    connection.index(index=index_name, doc_type=type_name, id=2,
                     body={"name": "Bill Baloney", "parsedtext": "Bill Testere nice guy", "uuid": "22222",
                           "position": 2,
                           "date": datetime(2013, 12, 8)})
    connection.index(index=index_name, doc_type=type_name + "2", id=2, body={"name": "data2", "value": "value2"},
                     parent=2)
    connection.index(index=index_name, doc_type=type_name, id=3, body={"name": "Bill Clinton", "parsedtext": """Bill is not
    nice guy""", "uuid": "33333", "position": 3, "date": datetime(2013, 12, 8)})

    connection.indices.refresh(index_name)