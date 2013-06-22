require_relative 'Portfolio'

class Client
  attr_accessor :name, :cashbal, :stockbal, :portfolios

  def initialize (name)
    @name = name
    @cashbal = 0
    @stockbal = 0
    @portfolios = {}
  end

  def create_portfolio(name)
    @portfolios[name] = Portfolio.new(name)
  end

  def new_stock(portname,sharename,numofshares)
    #stockprice = getstockprice(sharename)
    stockprice = Stock.quote(sharename)
    cost = numofshares * stockprice
    if cost <= @cashbal
      @portfolios[portname].buy_stock(sharename,numofshares)
      @cashbal -= cost
    else
      puts ("not enough available cash")
    end
  end

  def sell_stock(portname,sharename,numofshares)
    @portfolios[portname].sell_stock(sharename,numofshares)
    stockprice = Stock.quote(sharename)
    saleamount = stockprice * numofshares
    @cashbal += saleamount
  end

  def listportofolio(name)
    @portfolios.each {|k,v| "The client #{name} has #{k} #{v}"}
  end
end