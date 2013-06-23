require 'pry'
require 'pry-debugger'
require 'yahoofinance'
require_relative 'stock.rb'
require_relative 'stockquote.rb'
require_relative 'broker.rb'
require_relative 'client.rb'
require_relative 'portfolio.rb'
require_relative 'data.rb'

broker = nil
broker = Broker.new("Alex Brown")
stockquote = nil
stockquote = Stockquote.new()

broker = add_data(broker,stockquote)

def add_client(broker)
  print "Name:"
  name = gets.chomp
  print "Initial Balance:"
  initbal = gets.to_i
  broker.add_client(name,initbal)
end

def add_portfolio(broker)
  print "Name:"
  name = gets.chomp
  print "Portfolio Name:"
  portname = gets.chomp
  if broker.clients[name].nil?
    puts("Invalid client name")
  elsif
      if broker.clients[name].portfolios[portname].nil?
        broker.clients[name].create_portfolio(portname)
      else
        puts ("portfolio already exists")
      end
  end
end

def buy_share(broker,stockquote)
  print "Name:"
  name = gets.chomp
  print "Portfolio Name:"
  portname = gets.chomp
  print "Stock Name:"
  stockname = gets.chomp
  print "Enter Stock Quantity: "
  numofshares = gets.to_i
  broker.clients[name].new_stock(portname,stockname, numofshares,stockquote)
end

def sell_share(broker,stockquote)
  print "Client Name:"
  name = gets.chomp
  print "Portfolio Name:"
  portname = gets.chomp
  print "Stock Name:"
  stockname = gets.chomp
  print "Enter Stock Quantity: "
  numofshares = gets.to_i
  broker.clients[name].sell_stock(portname,stockname, numofshares,stockquote)
end

def get_bal(broker)
  print "Client Name: "
  name = gets.chomp
  puts(sprintf ("%.2f" %broker.clients[name].cashbal))
end

def  display_client_port(broker,stockquote)
  print "Client Name: "
  name = gets.chomp
  broker.clients[name].list_portfolio(stockquote)
  puts("Cash Balance: " + sprintf("%.2f" %broker.clients[name].cashbal))
end

def display_stock_portfolio(broker,stockquote)
  print "\nClient Name:"
  name = gets.chomp
  print "Portfolio Name:"
  portname = gets.chomp
  broker.clients[name].portfolios[portname].list_portfolio_detail(stockquote)
end

puts " "
print "add (c)lient or (p)ortfolio or (b)uy or s(ell) or bal(alance) or
W(Portfolio) or l(client list) or sp(stocks in portfolio)or (q)uit: "
response = gets.chomp.downcase

while response != 'q'
  if response == 'c'
    add_client(broker)

  elsif response == 'p'
    add_portfolio(broker)

  elsif response == 'b'
    buy_share(broker,stockquote)

  elsif response == 's'
    sell_share(broker,stockquote)

  elsif response == 'bal'
    get_bal(broker)

  elsif response == "w"
    display_client_port(broker,stockquote)

  elsif response == 'sp'
    display_stock_portfolio(broker,stockquote)

  elsif response == 'l'
    broker.list_clients
  end

print "\nadd (c)lient or (p)ortfolio or (b)uy or s(ell) or bal(alance) or
W(Portfolio) or l(client list) or sp(stocks in portfolio)or (q)uit: "
response = gets.chomp.downcase

end