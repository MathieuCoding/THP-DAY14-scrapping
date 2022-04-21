require 'rubygems'
require 'nokogiri'
require 'open-uri'
   
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
puts page.class   # => Nokogiri::HTML::Document

all_infos = []
page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody').each do |node|
    all_infos << node.text
end

puts all_infos[0]