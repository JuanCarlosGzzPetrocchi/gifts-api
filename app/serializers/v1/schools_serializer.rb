module V1
  # SchoolsSerializer
  class SchoolsSerializer < ActiveModel::Serializer
    attributes :name, :address
  end
end
