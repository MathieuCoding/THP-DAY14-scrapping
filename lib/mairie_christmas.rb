require 'rubygems'
require 'nokogiri'
require 'open-uri'

# Method to get an email address for one city
def get_townhall_email
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/95/avernes.html"))
    avernes_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    return avernes_email.text  
end


#Method to get URLs of each cities
def get_townhall_urls
    array_urls =[]
    main_page = "https://www.annuaire-des-mairies.com/"
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath('//a[@class="lientxt"]/@href').each do |url|
    return array_urls << main_page + url.content[2..-1]
    end
end

#Method to get names of each cities 
def get_townhall_names
    names = []
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath('//*[@class="lientxt"]').each do |node|
    names << node.content.split.map(&:capitalize).join(' ')
    return names
    end
end

#Method to get email addresses from all cities
def get_all_emails
    page = Nokogiri::HTML(URI.open(get_townhall_urls.to_s))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
        return  email.text
    end
end




get_townhall_email
get_townhall_urls
get_townhall_names
get_all_emails