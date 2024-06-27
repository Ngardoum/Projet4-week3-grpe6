require 'nokogiri'
require 'httparty'


url = "https://coinmarketcap.com/"


response = HTTParty.get(url)


doc = Nokogiri::HTML(response.body)

cryptocurrencies = []




doc.css('.cmc-table-row').each do |row|
  name = row.css('.cmc-link').text.strip
  price = row.css('.cmc-details-panel-price__price').text.strip


  if !name.empty? && !price.empty?
    
    cryptocurrencies << { name => price }
    puts "Récupéré : #{name} => #{price}" 
  end
end


puts "Données des cryptomonnaies récupérées :"
puts cryptocurrencies
