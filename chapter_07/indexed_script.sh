curl -XPOST localhost:9200/_scripts/groovy/my_script -d '{
     "script":"doc[\"price\"].value * factor"
}'