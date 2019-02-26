require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They see all products" do
    # ACT
    visit root_path
    #click on link for one item in the array at index 0 and get by name
    click_link(@category.products[0].name)

    # DEBUG
    save_screenshot

    # VERIFY
    #expect the page path
    expect(page).to have_current_path(product_path(@category.products[0]))
  end

end


# feature block => describe block
# scenario block => it block
# Run the test : bin/rspec spec/features