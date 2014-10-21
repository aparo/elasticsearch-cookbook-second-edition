from pyes import ES

es = ES()
index_name = "my_index"
type_name = "my_type"

from utils_pyes import create_and_add_mapping, populate

create_and_add_mapping(es, index_name, type_name)
populate(es, index_name, type_name)

from pyes.query import *
from pyes.filters import *

results = es.search(MatchAllQuery(), indices=index_name, doc_types=type_name)

print "total:", results.total
for r in results:
    print r

print "first element: ", results[0]
print "slice elements: ", results[1:4]

results = es.search(TermQuery("name", "joe", 3), indices=index_name, doc_types=type_name)

q1 = TermFilter("position", 1)
q2 = TermFilter("position", 2)
orq = ORFilter([q1, q2])
q = FilteredQuery(MatchAllQuery(), orq)

results = es.search(q, indices=index_name, doc_types=type_name)

es.indices.delete_index(index_name)
