require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "product attributes must not be empty" do
    product = Product.new(title: "My Book Title",
      description: "yyy",
      image_url: "zzz.jpg")
    assert product.invalid?
    # assert product.errors[:title].any?
    # assert product.errors[:description].any?
    # assert product.errors[:image_url].any?
    product.price = -1
    assert product.invalid?
    assert_equal["must be greater than or equal than 0.01"]
    product.price = 0
    assert product.invalid?
    assert_equal["must be greater than or equal than 0.01"]
    product.price = 1
    assert product.valid?
  end
end