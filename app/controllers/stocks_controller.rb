class StocksController < ApplicationController

  def search
    #check if search box is not empty
    if params[:stock].present?
      @stock = Stock.new_from_search(params[:stock])
      #if not empty render to path
      if @stock
        #do AJAX
        respond_to do |format|
          format.js{ render partial: 'users/result' }
        end
      #if invalid symbol display alert
      else
        respond_to do |format|
          flash.now[:danger] = "You have entered an invalid ticker symbol"
          format.js{ render partial: 'users/result' }
        end
      end
    # if empty search box display alerts
    else
      respond_to do |format|
        flash.now[:danger] = "Please enter ticker symbol in search box"
        format.js{ render partial: 'users/result' }
      end
    end
  end

end