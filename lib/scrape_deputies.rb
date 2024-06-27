
require 'nokogiri'
require 'httparty'


def get_deputy_email(deputy_url)
  response = HTTParty.get(deputy_url)
  doc = Nokogiri::HTML(response.body)

  
  email = doc.css('.deputes-liste-attributs .deputes-liste-email a').text.strip
  
  email
end


def get_deputies
  url = 'https://www2.assemblee-nationale.fr/deputes/liste/tableau'
  response = HTTParty.get(url)
  doc = Nokogiri::HTML(response.body)

  deputies = []

  
  doc.css('.deputes-liste-attributs').each do |deputy|
    full_name = deputy.css('.deputes-liste-nom a').text.strip
    deputy_url = "https://www2.assemblee-nationale.fr" + deputy.css('.deputes-liste-nom a').attr('href').value

    names = full_name.split
    first_name = names[0]
    last_name = names[1..].join(' ')
    email = get_deputy_email(deputy_url)

    deputies << { "first_name" => first_name, "last_name" => last_name, "email" => email }
    puts "Récupéré : #{first_name} #{last_name} => #{email}" 
  end

  deputies
end


if __FILE__ == $0
  puts "Données des députés :"
  puts get_deputies
end
