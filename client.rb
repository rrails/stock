require_relative 'portfolio.rb'
class Client
  attr_accessor :name, :cashbal,  :portfolios

  def initialize (name)
    @name = name
    @cashbal = 0
    @portfolios = {}
    @client_value = 0  #Current client share value
  end

  def create_portfolio(name)
    @portfolios[name] = Portfolio.new(name)
  end

  def new_stock(portname,sharename,numofshares,stockquote)
    stockprice = stockquote.quote(sharename)
    cost = numofshares * stockprice
    if cost <= @cashbal
      @portfolios[portname].buy_stock(sharename,numofshares)
      @cashbal -= cost
    else
      puts ("not enough available cash")
    end
  end

  def sell_stock(portname,sharename,numofshares,stockquote)
    @portfolios[portname].sell_stock(sharename,numofshares)
    stockprice = stockquote.quote(sharename)
    saleamount = stockprice * numofshares
    @cashbal += saleamount
  end

  def list_client_details
    puts("\t #{name}")
  end

  def list_portfolio(stockquote)
    @client_value = 0
    @portfolios.each { |k,v|
      @client_value += v.list_portfolio_detail(stockquote) }
    puts ("\nTotal Portfolio value: " + sprintf("%.2f" % @client_value))
  end
end