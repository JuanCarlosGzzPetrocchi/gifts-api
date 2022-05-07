module V1
  class OrdersSerializer < ActiveModel::Serializer
    attributes :workflow_status, :recipients, :gifts

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
          gift_type: gift.gift_type
        }
      end
    end
  end
end