require_relative 'spec_helper'
require_relative '../broker'
require_relative '../stockquote'
require 'yahoofinance'


describe Broker do
  let(:broker){Broker.new('Alex Brown')}
  let(:stockquote){Stockquote.new()}

  describe "#new" do
    it "creates a Broker object" do
      expect(broker).to_not eq nil
    end
  end

  describe ".new" do
    it "has a name" do
      expect(broker.name).to eq 'Alex Brown'
    end
    it "has no client" do
       expect(broker.clients.count).to eq 0
    end
  end

  describe ".add_client" do
    it "creates a client" do
      broker.add_client('Fred',500)
      expect(broker.clients['Fred'].name).to eq 'Fred'
    end
  end

  describe ".createportfolio" do
    it "creates a portfolio" do
      broker.add_client('Fred',500)
      broker.clients['Fred'].create_portfolio("Tech")
      expect(broker.clients['Fred'].portfolios["Tech"].name).to eq 'Tech'
    end
  end


  describe ".buy a stock" do
    it 'buys a stock' do
      broker.add_client('Fred',500)
      broker.clients['Fred'].create_portfolio("Tech")
      broker.clients['Fred'].new_stock("Tech","AAPT", 5, stockquote)
    end
  end

  describe ".sell a stock" do
    it 'sells a stock' do
      broker.add_client('Fred',500)
      broker.clients['Fred'].create_portfolio("Tech")
      broker.clients['Fred'].new_stock("Tech","AAPT", 5, stockquote)
      broker.clients['Fred'].sell_stock("Tech","AAPT", 3,stockquote)
    end
  end

end