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
    array_urls << main_page + url.content[2..-1]
    end
    return array_urls
end

#Method to get names of each cities 
def get_townhall_names
    names = []
    page = Nokogiri::HTML(URI.open("https://www.annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath('//*[@class="lientxt"]').each do |node|
    names << node.content.split.map(&:capitalize).join(' ')
    end
    return names
end

#Method to get email addresses from all cities
def get_all_emails
    array_mails = []
    get_townhall_urls.each do |url|
    main = Nokogiri::HTML(URI.open(url))
    main.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |all|
    array_mails << all.text
    end
    end
    return array_mails
end

#Method to combine both previous arrays
def get_final_array
    puts hash_contacts = Hash[get_all_emails.zip(get_townhall_names)]
end

#    page = Nokogiri::HTML(URI.open(get_townhall_urls.to_s))
#    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
#    end
#    return  email.text
#end




get_townhall_email
get_townhall_urls
get_townhall_names
get_all_emails
get_final_array