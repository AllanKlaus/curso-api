require 'rails_helper'

describe V2::ContactsController, type: :controller do
  describe 'GET index' do
    it 'request is 200 ok' do
      request.accept = 'application/vnd.api+json'
      get :index
      expect(response).to have_http_status :ok
    end

    it 'request is 406' do
      get :index
      expect(response).to have_http_status :not_acceptable
    end
  end

  describe 'GET show' do
    it 'request' do
      contact = Contact.first
      request.accept = 'application/vnd.api+json'
      get :show, params: { id: contact.id }
      json_response = JSON.parse(response.body, symbolize_names: true)
      expect(json_response.fetch(:data).fetch(:id)).to eq contact.id.to_s
    end
  end
end
