require 'rails_helper'

RSpec.describe Product, type: :model do
 describe 'Validation' do
    before(:each) do
      @product = Product.new
      @product.name = "Chair"
      @product.price = 70
      @product.quantity = 10
      @product.category = Category.new(name: "Furniture")
    end
    it 'Should have a name' do
      @product.name = nil 
      expect(@product).to_not be_valid
    end
    it 'Should have a price' do
      @product.price_cents = nil 
      expect(@product).to_not be_valid
    end
    it 'Should have a quantity' do
      @product.quantity = nil 
      expect(@product).to_not be_valid
    end
    it 'Should have a category' do
      @product.category = nil 
      expect(@product).to_not be_valid
    end
    it 'should have error messages on nil' do
      @product.name = nil 
      @product.valid?
      expect(@product.errors.full_messages).to include('Name can\'t be blank')
    end
  end
end
