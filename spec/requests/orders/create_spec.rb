require 'rails_helper'
describe 'POST /schools/:school_id/orders' do
  let(:school) do
    create :school
  end

  let(:recipient) do
    create(:recipient, school: school)
  end

  scenario 'valid request' do
    params = { recipient_ids: [recipient.id], gift_ids: [Gift.first.id, Gift.second.id] }
    post "/v1/schools/#{school.id}/orders", params: params

    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(school.orders.count).to eq 1
  end

  scenario 'invalid request' do
    params = { recipient_ids: [], gift_ids: [Gift.first.id, Gift.second.id]  }
    post "/v1/schools/#{school.id}/orders", params: params
  
    expect(response.status).to eq(400)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end
end