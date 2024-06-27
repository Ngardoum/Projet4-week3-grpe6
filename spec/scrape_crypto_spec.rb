
require 'rspec'
require_relative '../trader'

RSpec.describe 'fetch_crypto_prices' do
  it 'ne retourne pas d\'erreurs ni de retour vide' do
    result = fetch_crypto_prices
    expect(result).not_to be_empty
  end

  it 'sort un array cohérent avec quelques cryptomonnaies bien identifiées' do
    result = fetch_crypto_prices
    expect(result.any? { |hash| hash.keys.include?("Bitcoin") }).to be true
    expect(result.any? { |hash| hash.keys.include?("Ethereum") }).to be true
  end

  it 'l\'array est de taille cohérente' do
    result = fetch_crypto_prices
    expect(result.size).to be > 100 
  end
end
