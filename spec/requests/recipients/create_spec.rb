require 'rails_helper'
describe 'POST /schools/:school_id/recipients' do
  let(:school) do
    create :school
  end

  scenario 'valid request' do
    recipient_name = Faker::Name.name
    params = { name: recipient_name, address: Faker::Address.street_address }
    post "/v1/schools/#{school.id}/recipients", params: params

    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(school.recipients.last.name).to eq recipient_name
  end

  scenario 'invalid request' do
    params = { name: '', address: Faker::Address.street_address }
    post "/v1/schools/#{school.id}/recipients", params: params
  
    expect(response.status).to eq(400)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end
end