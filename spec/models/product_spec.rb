require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it 'creates a product' do
      @category = Category.create(name: "games")
      @product = Product.create(name: "Gameboy", price: 10000, quantity: 5, category: @category)
      expect(@product).to be_valid
    end

    it 'contains a name' do
      @category = Category.create(name: "games")
      @product = Product.create(name: nil, price: 100 , quantity: 5, category: @category)
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'contains a price' do
      @category = Category.create(name: "games")
      @product = Product.create(name: "Gameboy", price: nil , quantity: 5, category: @category)
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'contains a quantity' do
      @category = Category.create(name: "games")
      @product = Product.create(name: "Gameboy", price: 100 , quantity: nil, category: @category)
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'contains a category' do
      @category = Category.create(name: "games")
      @product = Product.create(name: "Gameboy", price: nil , quantity: 5, category: nil)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
