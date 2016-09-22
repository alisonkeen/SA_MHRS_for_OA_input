
This scraper generates just a list of people who have sat in either house of the South Australian Parliament (scraper #1 in the list below). 

scraper #1: List of MPS - https://morph.io/alisonkeen/SA\_MHRS\_for\_OA\_input
fields {id, saparl ID, full name}
destination: /var/www/openaustralia/openaustralia-parser/data/people.csv

scraper #2: List of MHRs - https://morph.io/alisonkeen/SA\_members\_for\_OA\_parser
fields {id, id2, Name, Electorate, State/Territory(?), Start date, Election type, End date, reason, Most recent party}
destination: /var/www/openaustralia/openaustralia-parser/data/representatives.csv

scraper #3: List of Senators - https://morph.io/alisonkeen/SA\_senators\_for\_OA\_parser
fields {id, id2, Name, Electorate, State/Territory(?), Start date, Election type, End date, reason, Most recent party}
destination: /var/www/openaustralia/openaustralia-parser/data/senators.csv

Ruby script to read these three .csv files into OpenAustralia: see https://github.com/alisonkeen/openaustralia-parser-sandbox/import-data-from-morph.rb


This is a scraper that runs on [Morph](https://morph.io). To get started [see the documentation](https://morph.io/documentation)
