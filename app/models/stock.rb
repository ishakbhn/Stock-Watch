class Stock < ApplicationRecord

  def self.new_from_search(ticker_symbol)
    search_stock = StockQuote::Stock.quote(ticker_symbol)
    new(name: search_stock.company_name, ticker: search_stock.symbol, last_price: search_stock.latest_price)
  end

end