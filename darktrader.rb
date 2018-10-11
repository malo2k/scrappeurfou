require 'rubygems'
require 'nokogiri'         
require 'open-uri'

def get_crypto_url(url)
    crypto = {}
    doc = Nokogiri::HTML(open(url))
    crypto[:name] = doc.css('h1 class="details-panel-item--name"').text.strip
    crypto[:price] = doc.css('span class="h2 text-semi-bold details-panel-item--price__value"').text
    puts crypto
  end
get_crypto_url("https://coinmarketcap.com/currencies/bitcoin/")

def get_crypto_money(url2)
    doc = Nokogiri::HTML(open(url2))

    crypto_links = []
    doc.css('a.currency-name-container.link-secondary').each do |macron|
      crypto_links << "https://coinmarketcap.com" + macron.text
    end

    crypto_price = []
	crypto_links.each do |url|
      crypto_price = get_crypto_url(url)
      arr << crypto_price
    end
    puts arr

end
 get_crypto_money("https://coinmarketcap.com/all/views/all/")

#après plus de 10 heures passées sur 2 putains d'exercices je crois qu'il est temps que je déclare forfait
#de plus mon ordi bloque 10min chaque fois que je lui demande un truc trop compliqué