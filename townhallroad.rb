require 'rubygems'
require 'nokogiri'         
require 'open-uri'

# def get_the_email_of_a_townhal_from_its_webpage(url)
# doc = Nokogiri::HTML(open(url))
# 	doc.css('tr > td')[6, 2].each do |email|
# 		puts email.text
# 	end
# end

#get_the_email_of_a_townhal_from_its_webpage("http://annuaire-des-mairies.com/95/vaureal.html")

def get_all_the_urls_of_val_doise_townhalls(url)
	mairies = Array.new
doc = Nokogiri::HTML(open(url))
	doc.css('//a[class="lientxt"][href]').each do |link|
		no_point = link['href']
		no_point = "http://annuaire-des-mairies.com#{no_point[1..-1]}"
		mairies << no_point
	end
	return mairies
end

#get_all_the_urls_of_val_doise_townhalls("http://annuaire-des-mairies.com/val-d-oise.html")

def get_all_the_email_of_all_the_urls(url)
	i = 0
	get_all_the_urls_of_val_doise_townhalls(url).each do
	doc = Nokogiri::HTML(open("#{get_all_the_urls_of_val_doise_townhalls(url)[i]}"))
	doc.css('tr > td')[7, 1].each do |email|
		puts email.text
	end
	i += 1
end
end

get_all_the_email_of_all_the_urls("http://annuaire-des-mairies.com/val-d-oise")