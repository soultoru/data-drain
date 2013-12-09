# coding: utf-8
 
require 'nokogiri'
require 'open-uri'

class Price
  attr_accessor :code
  attr_accessor :date
  attr_accessor :open
  attr_accessor :high
  attr_accessor :low
  attr_accessor :close
  attr_accessor :volume
  attr_accessor :turnover
end

code = "9984"
url = "http://k-db.com/site/jikeiretsu.aspx?c=#{code}-T"
doc = Nokogiri::HTML(open(url))

price = Price.new
doc.xpath('//div[@id="maintable"]/table/tbody/tr').each do |node|
  price.code     = code
  price.date     = node.children[0].text
  price.open     = node.children[1].text
  price.high     = node.children[2].text
  price.low      = node.children[3].text
  price.close    = node.children[4].text
  price.volume   = node.children[5].text
  price.turnover = node.children[6].text
  puts price.date
end

