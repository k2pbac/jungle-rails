require 'rails_helper'
count = 0
RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before(:all) do
      product = nil
    end
    before(:each) do
      @category = Category.new(name: 'Apparel');
    end
    after(:each) do 
      count += 1
    end
      it 'is valid with valid attributes' do
        product = Product.new(name: 'Golden Shoe', price_cents: 200.99, quantity: 2, category: @category)
        expect(product).to be_valid
      end
      it 'is not valid without a name attribute' do
        product = Product.new(name: nil, price_cents: 200.99, quantity: 2, category: @category)
        expect(product).to_not be_valid
        puts product.errors.full_messages[count-1]
      end
      it 'is not valid without a price_cents attribute' do 
        product = Product.new(name: 'Golden Shoe', price_cents: nil, quantity: 2, category: @category)
        expect(product).to_not be_valid
        puts product.errors.full_messages[count-1]
      end
      it 'is not valid without a quantity attribute' do 
        product = Product.new(name: 'Golden Shoe', price_cents: nil, quantity: nil, category: @category)
        expect(product).to_not be_valid
        puts product.errors.full_messages[count-1]
      end
      it 'is not valid without a category attribute'  do 
        product = Product.new(name: 'Golden Shoe', price_cents: nil, quantity: 2, category: nil)
        expect(product).to_not be_valid
        puts product.errors.full_messages[count-1]
      end
  end
end
