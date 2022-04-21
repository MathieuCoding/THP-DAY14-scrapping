require 'rubygems'
require 'nokogiri'
require 'open-uri'

def doc
return doc = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))   
end

def crypto_names
    crypto_names_array = []
    doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[2]').each do |node|
    crypto_names_array << node.text
    end
    return crypto_names_array
end

def crypto_values
    crypto_values_array = []
    doc.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span').each do |node|
    crypto_values_array << node.text
    end
    return crypto_values_array
end

def crypto_hash
    puts hash_crypto = Hash[crypto_names.zip(crypto_values)]
end

def perform
    doc
    crypto_names
    crypto_values
    crypto_hash
end

perform