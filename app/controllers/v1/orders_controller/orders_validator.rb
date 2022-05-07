# frozen_string_literal: true

module V1
  class OrdersController
    # Validate different Orders controller actions
    class OrdersValidator
      def initialize(params)
        @school = School.find_by(id: params[:school_id])
        @order = @school.orders.find_by(id: params[:order_id])
        @recipient_ids = params[:recipient_ids]
        @gift_ids = params[:gift_ids]
        @errors = {}
      end

      def create_errors
        recipients_existence
        gifts_existence
        recipient_amount
        @errors
      end

      def update_errors
        recipients_existence
        gifts_existence
        recipient_amount
        order_has_not_been_shipped
        @errors
      end

      def ship_errors
        @errors
      end

      def cancel_errors
        order_has_not_been_shipped
        @errors
      end

      private

      def recipients_existence
        return unless @school.recipients&.where(id: @recipient_ids)&.count != @recipient_ids&.count

        @errors[:recipient_existence] = I18n.t('.orders_validator.non_existing_recipients')
      end

      def gifts_existence
        return unless Gift.where(id: @gift_ids).count != @gift_ids&.count

        @errors[:gift_existence] = I18n.t('.orders_validator.non_existing_gifts')
      end

      def recipient_amount
        return if @recipient_ids.blank?

        @errors[:recipients_amount] = I18n.t('.orders_validator.too_many_recipients') if @recipient_ids.size > 20
      end

      def order_has_not_been_shipped
        @errors[:order_status] = I18n.t('.orders_validator.order_shipped') if @order.order_shipped?
      end
    end
  end
end
