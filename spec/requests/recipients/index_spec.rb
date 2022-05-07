require 'rails_helper'
describe 'GET /schools/:school_id/recipients/:id' do
  let(:school) do
    create :school
  end

  let!(:recipients) do
    create_list(:recipient, 2, school: school)
  end

  scenario 'valid request' do
    get "/v1/schools/#{school.id}/recipients"
    
    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(JSON.parse(response.body).size).to eq 2
  end
end