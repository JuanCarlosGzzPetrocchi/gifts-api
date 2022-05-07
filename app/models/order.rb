class Order < ApplicationRecord
  attr_reader :recipient_ids, :gift_ids

  enum workflow_status: %i[order_received order_processing order_shipped order_cancelled], _default: 'order_received'

  belongs_to :school

  has_many :order_recipients, dependent: :destroy
  has_many :recipients, through: :order_recipients

  has_many :order_gifts, dependent: :destroy
  has_many :gifts, through: :order_gifts
end
