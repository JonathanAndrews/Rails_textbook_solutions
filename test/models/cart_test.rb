require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "cart accepts unique line items" do
    cart = Cart.new
    cart.add_product(products(:one)).save!
    cart.add_product(products(:two)).save!

    assert_equal 2, cart.line_items.size
    assert_equal products(:one).price + products(:two).price, cart.total_price
  end

  test "cart accepts duplicate line items" do
    cart = Cart.create
    book_one = products(:one)
    cart.add_product(book_one).save!
    cart.add_product(book_one).save!

    assert_equal 2*book_one.price, cart.total_price
    assert_equal 1, cart.line_items.size
    assert_equal 2, cart.line_items[0].quantity
  end

end
