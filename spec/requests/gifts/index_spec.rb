# frozen_string_literal: true

require 'rails_helper'
describe 'GET /gifts' do
  scenario 'valid request' do
    get "/v1/gifts"

    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(JSON.parse(response.body).size).to eq 4
  end
end
