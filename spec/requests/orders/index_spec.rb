require 'rails_helper'
describe 'GET /schools/:school_id/orders' do
  let(:school) do
    create :school
  end

  let(:recipient) do
    create(:recipient, school: school)
  end

  let!(:order) do
    create_list(:order, 2, school: school, gifts: [Gift.first, Gift.second], recipients: [recipient])
  end

  scenario 'valid request' do
    get "/v1/schools/#{school.id}/orders"

    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body).size).to eq 2
  end
end