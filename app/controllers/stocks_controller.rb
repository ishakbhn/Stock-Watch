class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_search(params[:stock])
      render 'users/portfolio'
    else
      flash[:danger] = "Please enter ticker in search box"
      redirect_to portfolio_path
    end
  end

end