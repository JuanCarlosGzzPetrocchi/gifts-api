# frozen_string_literal: true

require 'rails_helper'
describe 'PATCH /schools/:id' do
  let(:school) do
    create :school
  end

  scenario 'valid request' do
    new_school_name = Faker::Company.name
    params = { name: new_school_name, address: Faker::Address.street_address }
    patch "/v1/schools/#{school.id}", params: params
    school.reload

    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(school.name).to eq new_school_name
  end

  scenario 'invalid request' do
    params = { name: '', address: Faker::Address.street_address }
    patch "/v1/schools/#{school.id}", params: params

    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end
end
