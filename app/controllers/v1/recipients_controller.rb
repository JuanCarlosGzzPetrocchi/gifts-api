# frozen_string_literal: true

module V1
  # Recipients controller
  class RecipientsController < ActionController::API
    before_action :find_school
    before_action :find_recipient, only: %i[update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
      recipient = @school.recipients.new(permitted_params)
      if recipient.save
        render json: recipient, status: 200, serializer: RecipientsSerializer
      else
        render json: { errors: recipient.errors }, status: 400
      end
    end

    def update
      if @recipient.update(permitted_params)
        render json: @recipient, status: 200, serializer: RecipientsSerializer
      else
        render json: { errors: @recipient.errors }, status: 400
      end
    end

    def destroy
      if @recipient.destroy
        render json: { message: I18n.t('.recipients_controller.recipient_deleted') }, status: 200
      else
        render json: { errors: @recipient.errors }, status: 400
      end
    end

    def index
      render json: @school.recipients, status: 200, each_serializer: RecipientsSerializer
    end

    private

    def find_school
      @school = School.find(params[:school_id])
    end

    def find_recipient
      @recipient = @school.recipients.find(params[:id])
    end

    def permitted_params
      params.permit(:name, :address)
    end

    def record_not_found
      render json: { error: I18n.t('.record_not_found') }, status: 400
    end
  end
end
