# frozen_string_literal: true

module V1
  # Gifts controller
  class GiftsController < ActionController::API
  
    def index
      render json: Gift.all, status: 200, each_serializer: GiftsSerializer
    end
  end
end
