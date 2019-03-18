require 'rails_helper'
require_relative '../support/new_customer_form.rb'

RSpec.feature "Customers", type: :feature, js: true do
  let(:new_customer_form) { NewCustomerForm.new }
  before do
    member = create(:member)
    login_as(member, scope: :member)
  end

  it 'Visit index page' do
    visit(customers_path)
    page.save_screenshot('screenshot.png')
    expect(page).to have_current_path(customers_path)
  end

  it 'Ajax' do
    visit(customers_path)
    click_link('Add Message')

    expect(page).to have_content('Yes!')
  end

  it 'find' do
    visit(customers_path)
    click_link('Add Message')
    expect(find('#my-div').find('h1')).to have_content('Yes!')
  end

  it 'Creates a customer - Page Object Pattern' do
    new_customer_form.login.visit_page.fill_in_with(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      address: Faker::Address.street_address
    ).submit

    expect(page).to have_content('Customer was successfully created')
  end

  it 'Creates a customer' do
    visit(new_customer_path)
    fill_in('Name', with: Faker::Internet.email)
    fill_in('Address', with: Faker::Address.street_address)

    click_button('Create Customer')
    expect(page).to have_content('Customer was successfully created')
  end
end
