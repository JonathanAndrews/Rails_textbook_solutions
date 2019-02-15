class StoreController < ApplicationController
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart
  def index
    @products = Product.order(:title)
    if session[:visits].nil?
      session[:visits] = 1
    else
      session[:visits] += 1
    end
    @visits = session[:visits]
  end
end
