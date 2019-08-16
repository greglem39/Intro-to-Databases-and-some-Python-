"""
    You may use the naive approach or an approach that uses list comprehensions.
    It is also up to you whether to use functions, although, if you
    are using list comprehensions, you will likely need function(s) that
    return values.
"""
# You are not required to use pprint,
# but is is handy to have for testing
from pprint import pprint
import csv
from operator import itemgetter  # for extra credit part

# put your code here

with open('places.csv', 'r') as csvfile:
    reader = csv.reader(csvfile)
    places_list = list(reader)
    rows = places_list

    print (rows)

def expand_places(rows):
    return [rows[0].title(), *rows[1].split(','), rows[2].lower(), rows[3], rows[4]]

expanded_places = [expand_places(row)  for row in rows]

pprint(expanded_places)

with open('reformatted_places.csv', 'w', newline='') as outfile:
   write = csv.writer(outfile)
   write.writerows(expanded_places)
