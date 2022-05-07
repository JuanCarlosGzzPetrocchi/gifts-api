require 'rails_helper'
describe 'PATCH /schools/:school_id/recipients/:id' do
  let(:school) do
    create :school
  end

  let(:recipient) do
    create(:recipient, school: school)
  end

  scenario 'valid request' do
    new_recipient_name = Faker::Name.name
    params = { name: new_recipient_name, address: Faker::Address.street_address }
    patch "/v1/schools/#{school.id}/recipients/#{recipient.id}", params: params

    recipient.reload
    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(recipient.name).to eq new_recipient_name
  end

  scenario 'invalid request' do
    params = { name: '', address: Faker::Address.street_address }
    patch "/v1/schools/#{school.id}/recipients/#{recipient.id}", params: params
  
    expect(response.status).to eq(400)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end
end