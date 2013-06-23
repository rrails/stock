require 'pry'
require 'pry-debugger'
require_relative 'broker.rb'
require_relative 'client.rb'
require_relative 'portfolio.rb'
require_relative 'stock.rb'

def add_data(broker,stockquote)

  broker.add_client('Tom',50000)
  broker.add_client('Sarah',20000)
  broker.add_client('Mike',5000)
  broker.clients['Tom'].create_portfolio("Tech")
  broker.clients['Tom'].create_portfolio("Bank")

  broker.clients['Mike'].create_portfolio("Tech")
  broker.clients['Mike'].create_portfolio("Health")
  broker.clients['Mike'].create_portfolio("Bank")

  broker.clients['Sarah'].create_portfolio("Tech")
  broker.clients['Sarah'].create_portfolio("Bank")
  broker.clients['Sarah'].create_portfolio("Health")

  broker.clients['Tom'].new_stock("Tech",'IBM', 50,stockquote)
  broker.clients['Tom'].new_stock("Tech",'ORCL', 35,stockquote)
  broker.clients['Tom'].new_stock("Bank",'BAC', 100,stockquote)

  broker.clients['Sarah'].new_stock('Tech', 'ACIW', 10,stockquote)
  broker.clients['Sarah'].new_stock('Tech', 'AAPL', 10,stockquote)
  broker.clients['Sarah'].new_stock('Tech', 'ORCL', 10,stockquote)

  broker.clients['Mike'].new_stock("Bank",'BAC', 50,stockquote)
  broker.clients['Mike'].new_stock("Health",'ACT', 10,stockquote)
  broker.clients['Mike'].new_stock("Health",'WCG', 20,stockquote)

  return broker
end
