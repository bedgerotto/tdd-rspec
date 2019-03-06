require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name -- sobrescrevendo atributo' do
    customer = create(:user, name: 'Bruno') # ou create(:customer, name: 'Bruno')
    expect(customer.full_name).to eq('Sr. Bruno')
  end

  it 'Herança' do
    customer = create(:customer_default)
    expect(customer.vip).to be_falsey
  end

  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to starting_with('Sr.')
  end

  it 'attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs)
    expect(customer.full_name).to starting_with('Sr.')
  end

  it 'Atributo transitório' do
    customer = create(:customer, upcased: true)

    expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Cliente masculino VIP' do
    customer = create(:customer_male_vip)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(true)
  end

  it 'Cliente masculino default' do
    customer = create(:customer_male_default)
    expect(customer.gender).to eq('M')
    expect(customer.vip).to eq(false)
  end

  it 'Cliente feminino default' do
    customer = create(:customer_female_default)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(false)
  end

  it 'Cliente feminino VIP' do
    customer = create(:customer_female_vip)
    expect(customer.gender).to eq('F')
    expect(customer.vip).to eq(true)
  end

  it 'Travel to' do
    travel_to Time.local(2004, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at).to eq(Time.new(2004, 11, 24, 01, 04, 44))
  end

  it { expect { create(:customer) }.to change { Customer.all.size }.by(1) }
end
