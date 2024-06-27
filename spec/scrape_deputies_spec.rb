require 'rspec'
require_relative '../scrape_deputies'

RSpec.describe 'Scraping des députés' do
  it 'récupère l\'e-mail d\'un député à partir de son URL' do
    email = get_deputy_email('https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA720442')
    expect(email).to eq('catherine.kamowski@assemblee-nationale.fr') # Vous pouvez ajuster selon l'e-mail actuel
  end

  it 'récupère la liste des députés et leurs e-mails' do
    deputies = get_deputies
    expect(deputies).not_to be_empty
    expect(deputies.any? { |hash| hash["first_name"] == "Catherine" && hash["last_name"] == "Kamowski" }).to be true
  end
end
