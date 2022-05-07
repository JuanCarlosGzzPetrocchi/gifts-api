module V1
  class RecipientsController < ActionController::API
    before_action :find_school
    before_action :find_recipient, only: %i[update destroy]
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def create
      recipient = @school.recipients.new(permitted_params)
      if recipient.save
        render json: recipient, status: 200, serializer: RecipientsSerializer
      else
        render json: recipient.errors, status: 400
      end
    end

    def update  
      if @recipient.update(permitted_params)
        render json: { message: 'Recipient updated'}, status: 200, serializer: RecipientsSerializer
      else
        render json: @recipient.errors, status: 400
      end
    end

    def destroy
      if @recipient.destroy
        render json: { message: 'Recipient deleted'}, status: 200
      else
        render json: @recipient.errors, status: 400
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
      params.require(:recipient).permit(:name, :address)
    end

    def record_not_found
      render json: { error: "Record not found"}, status: 400
    end
  end
end