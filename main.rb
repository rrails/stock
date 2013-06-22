require 'pry'
require 'pry-debugger'
require 'yahoofinance'
require_relative 'broker.rb'
require_relative 'client.rb'
require_relative 'portfolio.rb'
require_relative 'stock.rb'

broker = nil
broker = Broker.new("Alex Brown")

print "add (c)lient or (p)ortfolio or (b)uy or s(ell) or bal(alance) or W(Portfolio) or (q)uit: "
response = gets.chomp.downcase

while response != 'q'
  if response == 'c'
    # print "Name:"
    # name = gets.chomp
    # print "Initial Balance:"
    # initbal = gets.to_i
    # broker.add_client(name,initbal)
    broker.add_client('Tom',500)
    broker.add_client('Sarah',600)
  elsif response == 'p'
    # print "Name:"
    # name = gets.chomp
    # print "Portfolio Name:"
    # portname = gets.chomp
    # if broker.clients[name].nil?
    #   puts("Invalid client name")
    # elsif
    #   if broker.clients[name].portfolios[portname].nil?
    #     broker.clients[name].create_portfolio(portname)
    #   else
    #    puts ("portfolio already exists")
    #   end
    # end
    broker.clients['Tom'].create_portfolio("Tech")
    broker.clients['Tom'].create_portfolio("Bank")
    broker.clients['Sarah'].create_portfolio("Bank")
    broker.clients['Sarah'].create_portfolio("Bank")
  elsif response == 'b'
    print "Name:"
    name = gets.chomp
    print "Portfolio Name:"
    portname = gets.chomp
    print "Stock Name:"
    stockname = gets.chomp
    print "Enter Stock Quantity: "
    numofshares = gets.to_i
    broker.clients[name].new_stock(portname,stockname, numofshares)
  elsif response == 's'
    print "Client Name:"
    name = gets.chomp
    print "Portfolio Name:"
    portname = gets.chomp
    print "Stock Name:"
    stockname = gets.chomp
    print "Enter Stock Quantity: "
    numofshares = gets.to_i
    broker.clients[name].sell_stock(portname,stockname, numofshares)
  elsif response == 'bal'
    print "Client Name:"
    name = gets.chomp
    puts(broker.clients[name].cashbal)
  elsif response == "w"
    print "Client Name"
    name = gets.chomp
    broker.clients[name].listportofolio(name)
  end

print "add (c)lient or (p)ortfolio or (b)uy or s(ell) or bal(alance) or W(portfolio) or (q)uit: "
response = gets.chomp.downcase
end