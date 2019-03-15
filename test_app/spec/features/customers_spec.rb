require 'rails_helper'

RSpec.feature "Customers", type: :feature, js: true do
  before do
    member = create(:member)
    login_as(member, scope: :member)
  end

  it 'Visit index page' do
    visit(customers_path)
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
  end

  it 'Creates a customer' do
    visit(new_customer_path)
    fill_in('Name', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)

    click_button('Create Customer')
    expect(page).to have_content('Customer was successfully created')
  end
end
