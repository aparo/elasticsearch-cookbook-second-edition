import elasticsearch

es = elasticsearch.Elasticsearch()

index_name = "my_index"
type_name = "my_type"

es.indices.create(index_name)
es.cluster.health(wait_for_status="yellow")

es.indices.put_mapping(index=index_name, doc_type=type_name, body={type_name:{"_type": {"store": "yes"}, "properties": {
    "uuid": {"index": "not_analyzed", "type": "string", "store": "yes"},
    "title": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"},
    "parsedtext": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"},
    "nested": {"type": "nested", "properties": {"num": {"index": "not_analyzed", "type": "integer", "store": "yes"},
                                                "name": {"index": "not_analyzed", "type": "string", "store": "yes"},
                                                "value": {"index": "not_analyzed", "type": "string", "store": "yes"}}},
    "date": {"index": "not_analyzed", "type": "date", "store": "yes"},
    "position": {"index": "not_analyzed", "type": "integer", "store": "yes"},
    "name": {"index": "analyzed", "type": "string", "store": "yes", "term_vector": "with_positions_offsets"}}}})

mappings = es.indices.get_mapping(index_name, type_name)

es.indices.delete_mapping(index_name, type_name)

es.indices.delete(index_name)