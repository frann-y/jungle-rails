require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Items added to cart" do
    # ACT
    visit root_path
    # puts page.html 
    #click addtocart button
    #find(@category.products[0]).click_button('Add') 
    first('.product').click_button('Add') 

    # DEBUG
    save_screenshot

    # VERIFY
    #expect the cart to be updated
    within('nav') { expect(page).to have_content('My Cart (1)') }  end

end


### puts page.html t