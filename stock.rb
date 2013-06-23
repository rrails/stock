class Stock
  attr_accessor :sharename, :numofshares

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

  def list_stock_details(stockquote)
    puts ("\t Stock: #{sharename}, Quantity: #{numofshares}")
    return stockquote.quote(sharename) * numofshares
  end
end