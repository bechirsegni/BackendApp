require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "valid Category" do
    category = Category.new(name:'test')
    assert category.valid?
  end

  test "unvalid Category" do
    category = Category.new(name:'')
    assert_not category.valid?
  end

  test "max lenght" do
    category = Category.new(name: "x" * 101)
    assert_not category.valid?
  end

  test "uniqueness" do
    category = Category.new(name: "x")
    category2 = Category.new(name: "x")
    category.save
    assert_not category2.valid?
  end


end
