class StocksController < ApplicationController

  def search
    #check if search box is not empty
    if params[:stock].present?
      @stock = Stock.new_from_search(params[:stock])
      #if not empty render to path
      if @stock
        render 'users/portfolio'
      #if invalid symbol display alert
      else
        flash[:danger] = "You have entered an invalid ticker symbol"
        redirect_to portfolio_path
      end
    else
      flash[:danger] = "Please enter ticker symbol in search box"
      redirect_to portfolio_path
    end
  end

end