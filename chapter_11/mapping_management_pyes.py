from pyes import ES
import time
es = ES()

index_name = "my_index"
type_name = "my_type"

def create_and_add_mapping(connection, index_name, type_name):
    from pyes.mappings import DocumentObjectField
    from pyes.mappings import IntegerField
    from pyes.mappings import NestedObject
    from pyes.mappings import StringField, DateField

    from pyes.helpers import SettingsBuilder

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

    connection.ensure_index(index_name, settings)


create_and_add_mapping(es, index_name, type_name)
time.sleep(1)

mapping = es.indices.get_mapping(indices=index_name, doc_type=type_name)

es.indices.delete_index(index_name)