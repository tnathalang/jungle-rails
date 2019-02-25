require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validation' do
  it 'Should have a name' do
  @product = Product.new
  expect(@product.name).to be_present
  end
  it 'Should have a price' do
    @product = Product.new
    expect(@product.price).to be_present
  end
  it 'Should have a quantity' do
    @product = Product.new
    expect(@product.quantity).to be_present
   end
  it 'Should have a category' do
    @product = Product.new
    expect(@product.category).to be_present
    end
  end
end
