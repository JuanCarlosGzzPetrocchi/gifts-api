# frozen_string_literal: true

module V1
  # GiftsSerializer
  class GiftsSerializer < ActiveModel::Serializer
    attributes :id, :gift_type

    def gift_type
      I18n.t(".activerecord.attributes.gift.gift_type.#{object.gift_type}")
    end
  end
end
