require 'rails_helper'
describe 'PUT /schools/:school_id/orders/:order_id/cancel' do
  let(:school) do
    create :school
  end

  let(:recipient) do
    create(:recipient, school: school)
  end

  let(:order) do
    create(:order, school: school, gifts: [Gift.first, Gift.second], recipients: [recipient])
  end

  scenario 'valid request' do
    put "/v1/schools/#{school.id}/orders/#{order.id}/cancel"

    order.reload
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(order.workflow_status).to eq 'order_cancelled'
  end

  scenario 'invalid request' do
    order.update(workflow_status: :order_shipped)
    put "/v1/schools/#{school.id}/orders/#{order.id}/cancel"

    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end
end
