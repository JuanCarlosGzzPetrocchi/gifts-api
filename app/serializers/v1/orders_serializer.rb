# frozen_string_literal: true

module V1
  class OrdersSerializer < ActiveModel::Serializer
    attributes :workflow_status, :recipients, :gifts

    def workflow_status
      I18n.t(".activerecord.attributes.order.workflow_status.#{object.workflow_status}")
    end

    def recipients
      object.recipients.collect do |recipient|
        {
          name: recipient.name,
          address: recipient.address
        }
      end
    end

    def gifts
      object.gifts.collect do |gift|
        {
          gift_type: I18n.t(".activerecord.attributes.gift.gift_type.#{gift.gift_type}")
        }
      end
    end
  end
end
