# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  # Initialize test data
  let!(:categories) { create_list(:category, 5) }
  # let!(category_id) { categories.first.id }

  # Get category
  describe 'GET /categories' do # rubocop:disable RSpec/DescribeClass
    before { get 'api/v1/categories' }

    it 'returns categories' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Post category

  describe 'POST /category' do
    let(:valid_attributes) { { name: 'Horror' } }

    context 'when the request is valid' do
      before { post 'api/v1/categories', params: valid_attributes }

      it 'creates a category' do
        expect(json['name']).to eq('Horror')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post 'api/v1/categories', params: { name: nil } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end
end

