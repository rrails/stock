require_relative 'stock.rb'
class Portfolio
  attr_accessor :name, :stocks, :sharename, :numofshare

  def initialize (name)
    @name = name
    @stocks = {}
    @port_bal = 0
  end

  def buy_stock(sharename,numofshare)
    if @stocks[sharename].nil?
      @stocks[sharename] = Stock.new(sharename,0)
    end
    @stocks[sharename].buy(numofshare)
  end

  def sell_stock(sharename,numofshare)
    if (!@stocks[sharename].nil?) && (@stocks[sharename].numofshares > numofshare)
      @stocks[sharename].sell(numofshare)
    else
      puts("The client does not have sufficient number of shares to sell")
    end
  end

  def list_portfolio_detail(stockquote)
    @port_bal = 0
    puts ("\nPortfolio: #{name}");
    @stocks.each {|k,v|
      @port_bal += v.list_stock_details(stockquote)
    }
    puts ("Portfolio balance is " + sprintf("%.2f" % @port_bal))
    return @port_bal
  end
end