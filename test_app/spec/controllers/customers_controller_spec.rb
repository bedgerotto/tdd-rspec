require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe 'as Guest' do
    context '#index' do
      it 'responds successfully' do
        get :index
        expect(response).to be_successful
      end

      it 'returns a 200 response' do
        get :index
        expect(response).to have_http_status 200
      end
    end

    it 'returns a 302 response (not authorized)' do
      customer = create(:customer)
      get :show, params: { id: customer.id }
      expect(response).to have_http_status 302
    end
  end

  describe 'as logged Member' do
    before do
      member = create(:member)
      sign_in member
    end

    it 'with valid params' do
      customer_params = attributes_for(:customer)
      expect{post :create, params: { customer: customer_params }}.to change(Customer, :count).by(1)

    end

    context '#show' do
      before do
        customer = create(:customer)

        get :show, params: { id: customer.id }
      end

      it 'returns 200 response' do
        expect(response).to have_http_status 200
      end

      it 'renders show template' do
        expect(response).to render_template :show
      end
    end
  end
end
