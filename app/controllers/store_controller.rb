class StoreController < ApplicationController
  include CurrentCart
  skip_before_action :authorize
  before_action :set_cart
  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      if session[:visits].nil?
        session[:visits] = 1
      else
        session[:visits] += 1
      end
      @visits = session[:visits]
    end
  end
end
