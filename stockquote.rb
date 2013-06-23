class Stockquote

  def initialize
  end

  def quote(sharename)
    YahooFinance::get_quotes(YahooFinance::StandardQuote, sharename)[sharename].lastTrade
    rescue
  end
end