#!/bin/env ruby
# encoding: utf-8

# This script started off as a shamelessly plagiarized version of the Popolo/ EveryPolitician Virgin Islands example scraper (thanks, guys!!)
# Hopefully it isn't too similar but it gave me a very readable starting point, as a ruby beginner. :) 
# - Alison

# Original is here: 
# https://github.com/tmtmtmtm/us-virgin-islands-legislature/blob/master/scraper.rb
# And then became my other SA scraper, then this one. 

require 'scraperwiki'
require 'nokogiri' # Mechanize will have to wait for next week
#require 'open-uri'

# This is stopping me from debugging/running
# what do I need these for? 

# require 'colorize'
# require 'pry'
# require 'open-uri/cached'
# OpenURI::Cache.cache_path = '.cache'

sa_mps_url = 'https://www2.parliament.sa.gov.au/Internet/DesktopModules/Memberlist.aspx'

def noko_for(url)
  Nokogiri::HTML(open(url).read)
end

def scrape_list(url)
  noko = noko_for(url)
  noko.css('table table table tr').css('a[href*="MemberDrill"]').each do |a|
    mp_url = URI.join url, a.attr('href')
    add_person_to_list(a.text, mp_url)
  end
end

def add_person_to_list(mp_name, url)

   mp_ID =  url.to_s.split("=").last
   puts mp_ID+", "+mp_ID+", "+ mp_name.to_s

   # This is expected in the OpenAustarlia/TWFY import script, 
   # in the interests of not changing anything more than I need to, here is
   # a blank field for backwards-compatibility... 
   mp_birthday = ""

   data = { 
     id: mp_ID,
     id__saparl: mp_ID,
     full_name: mp_name,
     birthday: mp_birthday
   }

   ScraperWiki.save_sqlite([:id], data)

end

scrape_list(sa_mps_url)

#Testing: just try it on one page first... 
#scrape_person('Frances Bedford', 'https://www2.parliament.sa.gov.au/Internet/DesktopModules/MemberDrill.aspx?pid=543')
