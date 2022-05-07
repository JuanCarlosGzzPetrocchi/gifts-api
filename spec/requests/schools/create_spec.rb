require 'rails_helper'
describe 'POST /schools' do

  scenario 'valid request' do
    school_name = Faker::Company.name
    params = { name: school_name, address: Faker::Address.street_address }
    post '/v1/schools', params: params

    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(School.last.name).to eq school_name
  end

  scenario 'invalid request' do
    params = { address: Faker::Address.street_address }
    post '/v1/schools', params: params

    expect(response.status).to eq(400)
  end
end