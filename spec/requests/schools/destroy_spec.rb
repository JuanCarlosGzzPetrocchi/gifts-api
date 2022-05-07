require 'rails_helper'
describe 'DELETE /schools/:id' do
  let(:school) do
    create :school
  end

  scenario 'valid request' do
    delete "/v1/schools/#{school.id}"
  
    expect(response.status).to eq(200)
    expect(response.content_type).to eq("application/json; charset=utf-8")
    expect(School.count).to eq 0
  end

  scenario 'invalid request' do
    patch "/v1/schools/#{school.id + 1}"
  
    expect(response.status).to eq(400)
    expect(response.content_type).to eq("application/json; charset=utf-8")
  end
end