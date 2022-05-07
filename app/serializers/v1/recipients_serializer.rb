# frozen_string_literal: true

module V1
  # RecipientsSerializer
  class RecipientsSerializer < ActiveModel::Serializer
    attributes :name, :address
  end
end
