__author__ = 'alberto'
from pyes import ES

import random
import os
import codecs
from lorem_ipsum import words
from datetime import datetime, timedelta
import sys
def get_names():
    """
    Return a list of names.
    """
    return [n.strip().replace("'", "-") for n in codecs.open(os.path.join("data", "names.txt"), "rb", 'utf8').readlines()]

# 90
# long 180

class SampleMaker(object):
    def __init__(self, name):
        log = open(name, "wb")
        self.log = log
        self.conn = ES(("http", "127.0.0.1", 9200), timeout=300.0, log_curl=True, dump_curl=log)
        self.index_name = "test-index"
        self.document_type = "test-type"
        self.conn.delete_index_if_exists(self.index_name)
        self.init_default_index()


    def init_default_index(self):
        from pyes.helpers import SettingsBuilder
        settings = SettingsBuilder()
        from pyes.mappings import DocumentObjectField
        from pyes.mappings import IntegerField
        from pyes.mappings import NestedObject
        from pyes.mappings import StringField, DateField, BooleanField, GeoPointField, FloatField

        docmapping = DocumentObjectField(name=self.document_type)
        docmapping.add_property(
            StringField(name="description", store=True, term_vector="with_positions_offsets", index="analyzed"))
        docmapping.add_property(
            StringField(name="name", store=True, term_vector="with_positions_offsets", index="analyzed"))
        docmapping.add_property(StringField(name="tag", store=True, index="not_analyzed"))
        docmapping.add_property(IntegerField(name="age", store=True))
        docmapping.add_property(FloatField(name="price"))
        docmapping.add_property(DateField(name="date", store=True))
        docmapping.add_property(BooleanField(name="in_stock", store=True, index="not_analyzed"))
        docmapping.add_property(GeoPointField(name="position"))
        nested_object = NestedObject(name="metadata")
        nested_object.add_property(StringField(name="name", store=True))
        nested_object.add_property(StringField(name="value", store=True))
        nested_object.add_property(IntegerField(name="num", store=True))
        docmapping.add_property(nested_object)
        settings.add_mapping(docmapping)

        self.conn.ensure_index(self.index_name, settings)

    def generate_datafile(self, number_items=1000):
        """
        Generate a dataset with number_items elements.
        """

        names = get_names()
        totalnames = len(names)
        #init random seeder
        random.seed()
        #calculate items
        #    names = random.sample(names, number_items)
        for i in xrange(number_items):
            data = {"name": names[random.randint(0, totalnames - 1)],
                   "age": random.randint(1, 100),
                   "price": random.random()*100.0,
                   "tag":[words(1, False) for r in xrange(random.randint(1, 5))],
                   "in_stock": random.choice([True, False]),
                   "date": datetime.now()+timedelta(days=random.choice([1, -1])*random.randint(0,1000)),
                   "position": {
                       "lat" : random.choice([1, -1])* random.random()*90.0,
                        "lon" : random.choice([1, -1])* random.random()*180.0

                   },
                   "description": words(random.randint(1, 100), False),
                   "metadata":[{"name":names[random.randint(0, totalnames - 1)],
                                "value":str(random.randint(1, 5)), "num":random.randint(1, 50) } for r in xrange(random.randint(1, 5))]
                   }
            self.conn.index(data, self.index_name, self.document_type, id=str(i+1))


    def close(self):
        self.conn.flush(self.index_name)
        self.log.close()

if __name__ == '__main__':
    sm = SampleMaker(name="populate_facets.sh")
    sm.generate_datafile()
    sm.close()

