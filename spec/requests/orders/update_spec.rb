require 'rails_helper'
describe 'PATCH /schools/:school_id/orders/:id' do
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
    params = { recipient_ids: [recipient.id], gift_ids: [Gift.third.id, Gift.fourth.id] }
    patch "/v1/schools/#{school.id}/orders/#{order.id}", params: params

    order.reload
    expect(response.status).to eq(200)
    expect(response.content_type).to eq('application/json; charset=utf-8')
    expect(order.gifts.ids).to eq [Gift.third.id, Gift.fourth.id]
  end

  scenario 'invalid request' do
    order.update(workflow_status: :order_shipped)
    params = { recipient_ids: [recipient.id], gift_ids: [Gift.third.id, Gift.fourth.id] }
    patch "/v1/schools/#{school.id}/orders/#{order.id}", params: params

    expect(response.status).to eq(400)
    expect(response.content_type).to eq('application/json; charset=utf-8')
  end
end
