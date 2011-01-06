require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  def test_invalid_with_empty_attributes
    product = Product.new
    assert !product.valid?
    assert product.errors[:code].any?
    assert product.errors[:name].any?
  end

  def test_unique_code
    product = Product.new(:code => products(:ScrumBook).code,
      :name => "Scrum Process")
    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages')[:taken], product.errors[:code].join
  end
end
