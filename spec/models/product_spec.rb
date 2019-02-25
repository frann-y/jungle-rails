require 'rails_helper'

#Generic code when generated
# RSpec.describe Product, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    #moving everything in here from validations 
  before(:each) do
    @product = Product.new
    @product.name = "Shoe"
    @product.price = 25
    @product.quantity = 5
    #how to create a category & an object
    @product.category = Category.new({name: "Apparel"})
  end

    #Test to validates everything exists
    it "is valid if it all exists" do
    #create a product and create a whole object
      expect(@product).to be_valid
    end

    # validates :name, presence: true
    it "is not valid without a name" do
      #create a product and create a whole object
      #this test wants to fail
      @product.name = nil
      expect(@product).to_not be_valid
      #an array to pront the error messages
      #put in anywords in "" , then copy and paste error message into the ""
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    # validates :price, presence: true
    it "is not valid without a price" do
    #price is weird. it will convert it to cents. 
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end
    # validates :quantity, presence: true
    it "is not valid without a quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid    
    end

    # validates :category, presence: true
    it "is not valid without a category" do
      @product.quantity = nil
      expect(@product).to_not be_valid #to_not be_valid?
    end


    #for each, pass in a block
    #it --name--- do
  end
end