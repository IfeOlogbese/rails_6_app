class StoreController < ApplicationController
  include CurrentCart

  before_action :set_cart
  before_action :record_index_view, only: [:index]

  def index
    @products = Product.order(:title)
  end

  private

  def record_index_view
    if session[:counter].nil?
      session[:counter] = 1
    else
      session[:counter] += 1
    end
    @counter = session[:counter]
  end
end
