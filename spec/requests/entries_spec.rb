require 'rails_helper'

RSpec.describe 'Entries API', type: :request do
  let!(:entries) { create_list(:entry, 5) }
  let(:entry_id) { entries.first.id }

  describe 'GET/entries' do
    before { get'/entries' }

    it 'returns entries' do
      expect(json).not_to be_empty
      expect(json.size).to eq(5)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/entries/:id' do
    before { get "/entries/#{entry_id}" }

    context 'when the record exists' do
      it 'returns the entry' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(entry_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:entry_id){59}

      it 'returns a status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Entry/)
      end
    end
  end

  describe 'POST/entries' do
    let(:valid_entry) do
      { title: 'blog', description: 'a post', body: 'this is a  blog post' }
    end

    context 'when request attributes are valid' do
      before { post'/entries', params: valid_entry }

      it 'creates an entry' do
        expect(json['body']).to eq('this is a  blog post')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post '/entries', params: { title: 'failed' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match (/Validation failed: Description can't be blank, Body can't be blank/)
      end
    end
  end

  describe 'PUT /entries/:id' do
    let(:entry) { { title: 'Proper title' } }

    before { put "/entries/#{entry_id}", params: entry }

    context 'when entry exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the entry' do
        expect(response.body).to be_empty
      end
    end
  end

  describe 'DELETE /entries/:id' do
    before do
      delete "/entries/#{entry_id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
