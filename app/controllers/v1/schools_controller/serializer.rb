module V1
  class SchoolsController
    # SchoolsController serializer
    class Serializer < ActiveModel::Serializer
      attributes :name, :address
    end
  end
end

