import elasticsearch

es = elasticsearch.Elasticsearch()

index_name = "my_index"

es.indices.create(index_name)

es.cluster.health(wait_for_status="yellow")

es.indices.close(index_name)

es.indices.open(index_name)

es.cluster.health(wait_for_status="yellow")

es.indices.optimize(index_name)

es.indices.delete(index_name)
