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
    let(:customer) { create(:customer) }
    before do
      member = create(:member)
      sign_in member
    end

    it { is_expected.to route(:get, '/customers').to(action: :index) }

    it 'Flash Notice' do
      customer_params = attributes_for(:customer)
      post :create, params: { customer: customer_params }

      expect(flash[:notice]).to match /successfully created/
    end

    it '#show Content-Type JSON' do
      get :show, format: :json, params: { id: customer.id }

      expect(response.content_type).to eq('application/json')
    end

    it '#create Content-Type JSON' do
      customer_params = attributes_for(:customer)
      post :create, format: :json, params: { customer: customer_params }

      expect(response.content_type).to eq('application/json')
    end

    it 'with valid params' do
      customer_params = attributes_for(:customer)
      expect { post :create, params: { customer: customer_params } }.to change(Customer, :count).by(1)
    end

    it 'with invalid params' do
      customer_params = attributes_for(:customer, address: nil)
      expect { post :create, params: { customer: customer_params } }.not_to change(Customer, :count)
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
