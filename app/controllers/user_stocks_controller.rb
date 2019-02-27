class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if @stock.blank?
      stock = Stock.new_from_search(params[:stock_ticker])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "#{@user_stock.stock.name} was successfully added to portfolio"
    redirect_to portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    flash[:notice] = "Successfully removed from portfolio"
    redirect_to portfolio_path
  end
end