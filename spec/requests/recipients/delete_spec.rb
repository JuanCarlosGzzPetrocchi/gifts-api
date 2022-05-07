require 'rails_helper'
describe 'DELETE /schools/:school_id/recipients/:id' do
  let(:school) do
    create :school
  end

  let(:recipient) do
    create(:recipient, school: school)
  end

  scenario 'valid request' do
    delete "/v1/schools/#{school.id}/recipients/#{recipient.id}"

    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(Recipient.count).to eq 0
  end

  scenario 'invalid request' do
    delete "/v1/schools/#{school.id}/recipients/#{recipient.id + 1}"
  
    expect(response.status).to eq(400)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end
end