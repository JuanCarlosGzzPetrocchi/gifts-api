# frozen_string_literal: true

module V1
  # SchoolsSerializer
  class SchoolsSerializer < ActiveModel::Serializer
    attributes :id, :name, :address
  end
end
