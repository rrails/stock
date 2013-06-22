class Stock
  attr_accessor :name, :numofshares

  def initialize (name, numofshares)
    @sharename = name
    @numofshares = 0
  end

  def buy(numofshares)
    @numofshares += numofshares
  end

  def sell(numofshares)
    @numofshares -= numofshares
  end

  def Stock.quote(sharename)
    YahooFinance::get_quotes(YahooFinance::StandardQuote, sharename)[sharename].lastTrade
  end




end

=begin
  sell a stock
  buy a stock
  get price of stock
=end
