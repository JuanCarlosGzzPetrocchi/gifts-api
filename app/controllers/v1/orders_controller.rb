module V1
  class OrdersController < ActionController::API
    before_action :find_school
    before_action :find_order, only: %i[update cancel ship]
    before_action :initialize_orders_validator, except: :index
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def create
      if @order_validator.create_errors.blank?
        order = @school.orders.new
        order.recipients << find_recipients
        order.gifts << find_gifts
        order.save
        render json: order, status: 200, serializer: OrdersSerializer
      else
        render json: @order_validator.create_errors, status: 400
      end
    end

    def update
      if @order_validator.update_errors.blank?
        @order.order_recipients.destroy_all
        @order.order_gifts.destroy_all
        @order.recipients << find_recipients
        @order.gifts << find_gifts
        render json: @order, status: 200, serializer: OrdersSerializer
      else
        render json: @order_validator.update_errors, status: 400
      end
    end

    def cancel
      if @order_validator.cancel_errors.blank?
        @order.update(workflow_status: :order_cancelled)
        render json: { message: 'Order canceled'}, status: 200
      else
        render json: @order_validator.cancel_errors, status: 400
      end
    end

    def ship
      if @order_validator.ship_errors.blank?
        @order.update(workflow_status: :order_shipped)
        OrderMailer.order_shipped(order_id: @order.id)
        render json: { message: 'Order shipped!'}, status: 200
      else
        render json: @order.ship_errors, status: 400
      end
    end

    def index
      render json: @school.orders, status: 200, each_serializer: OrdersSerializer
    end

    private

    def find_school
      @school = School.find(params[:school_id])
    end

    def find_order
      @order = @school.orders.find(params[:order_id])
    end

    def initialize_orders_validator
      validator_params = permitted_params.merge(school_id: @school.id, order_id: @order.id)
      @order_validator = OrdersValidator.new(validator_params)
    end

    def find_recipients
      @school.recipients.where(id: permitted_params[:recipient_ids])
    end

    def find_gifts
      Gift.where(id: permitted_params[:gift_ids])
    end

    def permitted_params
      params.permit(recipient_ids: [], gift_ids: [])
    end

    def record_not_found
      render json: { error: "Record not found"}, status: 400
    end
  end
end