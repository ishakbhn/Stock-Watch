class Stock < ApplicationRecord
  has_many :user_stocks
  has_many :users, through: :users_stocks

  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end

  def self.new_from_search(ticker_symbol)
    begin
      search_stock = StockQuote::Stock.quote(ticker_symbol)
      new(name: search_stock.company_name, ticker: search_stock.symbol, last_price: search_stock.latest_price)
    # if invalid ticker name return nil
    rescue Exception => e
      return nil
    end
  end

end