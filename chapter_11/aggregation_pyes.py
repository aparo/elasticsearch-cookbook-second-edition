from pyes import ES

es = ES()
index_name = "my_index"
type_name = "my_type"

from utils_pyes import create_and_add_mapping, populate

create_and_add_mapping(es, index_name, type_name)
populate(es, index_name, type_name)

from pyes.query import *
from pyes.aggs import *

q = MatchAllQuery()
q = q.search()
q.get_agg_factory().add(TermsAgg('pterms', field="parsedtext"))

results = es.search(q, indices=index_name, doc_types=type_name)

q = MatchAllQuery()
q = q.search()
q.get_agg_factory().add(DateHistogramAgg('date_add',
    field='date',
    interval='month'))

results = es.search(q, indices=index_name, doc_types=type_name)

es.indices.delete_index(index_name)
