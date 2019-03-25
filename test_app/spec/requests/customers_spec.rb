require 'rails_helper'

RSpec.describe "Customers", type: :request do
  describe "GET /customers" do
    it "works! 200 OK" do
      get customers_path
      expect(response).to have_http_status(200)
    end

    it "Index - JSON 200 OK" do
      get '/customers.json'
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        [
          id: /\d/,
          name: (be_kind_of String),
          email: (be_kind_of String)
        ]
      )
    end

    it "Show - JSON 200 OK" do
      get '/customers/1.json'
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(
        id: /\d/,
        name: (be_kind_of String),
        email: (be_kind_of String)
      )
    end

    it 'Create - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { 'ACCEPT' => 'application/json' }

      customer_params = attributes_for :customer

      post '/customers', params: { customer: customer_params}, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customer_params[:name],
        email: customer_params[:email]
      )
    end

    it 'Update - JSON' do
      member = create(:member)
      login_as(member, scope: :member)

      headers = { 'ACCEPT' => 'application/json' }

      customer = Customer.first
      customer.name += ' - Atualizado'

      patch "/customers/#{customer.id}.json", params: { customer: customer.attributes }, headers: headers
      expect(response.body).to include_json(
        id: /\d/,
        name: customer.name,
        email: customer.email
      )
    end
  end
end
