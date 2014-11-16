from pyes import ES

es = ES()
index_name = "my_index"
type_name = "my_type"

from utils_pyes import create_and_add_mapping, populate

create_and_add_mapping(es, index_name, type_name)
populate(es, index_name, type_name)

from pyes.query import *

q = MatchAllQuery()
q = q.search()
q.facet.add_term_facet('tag')

results = es.search(indices=index_name, doc_types=type_name, query=q)

from pyes.facets import *
q = MatchAllQuery()
q = q.search()
q.facet.facets.append(DateHistogramFacet('date_facet',
    field='date',
    interval='month'))

results = es.search(indices=index_name, doc_types=type_name, query=q)

es.indices.delete_index(index_name)
