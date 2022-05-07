module V1
  class RecipientsController
    # RecipientsController serializer
    class Serializer < ActiveModel::Serializer
      attributes :name, :address
    end
  end
end

