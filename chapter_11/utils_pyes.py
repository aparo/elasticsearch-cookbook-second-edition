__author__ = 'alberto'

def create_and_add_mapping(connection, index_name, type_name):
    from pyes.mappings import DocumentObjectField
    from pyes.mappings import IntegerField
    from pyes.mappings import NestedObject
    from pyes.mappings import StringField, DateField

    from pyes.helpers import SettingsBuilder

    #we try to delete index if exists
    try:
        connection.indices.delete(index_name)
    except:
        pass

    settings = SettingsBuilder()
    docmapping = DocumentObjectField(name=type_name)
    docmapping.add_property(
        StringField(name="parsedtext", store=True, term_vector="with_positions_offsets", index="analyzed"))
    docmapping.add_property(
        StringField(name="name", store=True, term_vector="with_positions_offsets", index="analyzed"))
    docmapping.add_property(
        StringField(name="title", store=True, term_vector="with_positions_offsets", index="analyzed"))
    docmapping.add_property(IntegerField(name="position", store=True))
    docmapping.add_property(DateField(name="date", store=True))
    docmapping.add_property(StringField(name="uuid", store=True, index="not_analyzed"))
    nested_object = NestedObject(name="nested")
    nested_object.add_property(StringField(name="name", store=True))
    nested_object.add_property(StringField(name="value", store=True))
    nested_object.add_property(IntegerField(name="num", store=True))
    docmapping.add_property(nested_object)
    settings.add_mapping(docmapping)

    docmapping = DocumentObjectField(name=type_name+"2", _parent={"type": type_name})

    settings.add_mapping(docmapping)

    connection.ensure_index(index_name, settings)

def populate(connection, index_name, type_name):
    connection.index(doc={"name": "Joe Tester", "parsedtext": "Joe Testere nice guy", "uuid": "11111", "position": 1},
             index=index_name, doc_type=type_name, id=1)
    connection.index(doc={"name": "data1", "value": "value1"}, index=index_name, doc_type=type_name + "2", id=1, parent=1)
    connection.index(doc={"name": "Bill Baloney", "parsedtext": "Bill Testere nice guy", "uuid": "22222", "position": 2},
             index=index_name, doc_type=type_name, id=2, bulk=True)
    connection.index(doc={"name": "data2", "value": "value2"}, index=index_name, doc_type=type_name + "2", id=2, parent=2,
             bulk=True)
    connection.index(doc={"name": "Bill Clinton", "parsedtext": """Bill is not
            nice guy""", "uuid": "33333", "position": 3}, index=index_name, doc_type=type_name, id=3, bulk=True)

    connection.indices.refresh(index_name)
