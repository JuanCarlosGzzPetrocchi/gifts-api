# frozen_string_literal: true

module V1
  # GiftsSerializer
  class GiftsSerializer < ActiveModel::Serializer
    attributes :gift_type
  end
end
