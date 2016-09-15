
Scrapes just the list of MPS and their URLS, but not which house they belong to.

BROKEN I can't figure out why this doesn't actually put anything into a Sqlite database!? It does on my own machine but not on Morph.io

Those two csv files need to be generated separately to get their own URLs, so that forked openaustralia parsers can pull them into a database. 

scraper #1: List of MPS - this one:
fields {id, saparl ID, full name}
destination: /var/www/openaustralia/openaustralia-parser/data/people.csv

scraper #2: List of MHRs - (coming soon) 
fields {id, id2, Name, Electorate, State/Territory(?), Start date, Election type, End date, reason, Most recent party}

scraper #3: List of Senators - (coming soon)
fields {id, id2, Name, Electorate, State/Territory(?), Start date, Election type, End date, reason, Most recent party}


This is a scraper that runs on [Morph](https://morph.io). To get started [see the documentation](https://morph.io/documentation)
