require 'rails_helper'

#Generic code when generated
# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    #Test to validates everything exists
    it "is valid if it all exists" do
    #create a product and create a whole object
      @product = Product.new
      @product.name = "Shoe"
      @product.price = 25
      @product.quantity = 5
      #how to create a category & an object
      @product.category = Category.new({name: "Apparel"})
      expect(@product).to be_valid
    end

    # validates :name, presence: true
    it "is not valid without a name" do
      #create a product and create a whole object
      @product = Product.new
      @product.name = "Sock"
      @product.price = 10
      @product.quantity = 10
      @product.category = Category.new({name: "Apparel"})
      expect(@product).to be_valid
    end

    # validates :price, presence: true
    it "is not valid without a price" do
      @product = Product.new
      @product.name = "Tights"
      @product.price = 20
      @product.quantity = 20
      @product.category = Category.new({name: "Apparel"})
      expect(@product).to be_valid
    end
    # validates :quantity, presence: true
    it "is not valid without a quantity" do
      @product = Product.new
      @product.name = "Pantyhose"
      @product.price = 15
      @product.quantity = 15
      @product.category = Category.new({name: "Apparel"})
      expect(@product).to be_valid    
    end

    # validates :category, presence: true
    it "is not valid without a category" do
      @product = Product.new
      @product.name = "Long Johns"
      @product.price = 25
      @product.quantity = 25
      @product.category = Category.new({name: "Apparel"})
      expect(@product).to be_valid
    end

    #for each, pass in a block
    #it --name--- do
  end
end