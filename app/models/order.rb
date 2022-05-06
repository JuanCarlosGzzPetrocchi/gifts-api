class Order < ApplicationRecord
  belongs_to :school

  has_many :order_recipients
  has_many :recipients, through: :order_recipients

  has_many :order_gifts
  has_many :gifts, through: :order_gifts

  enum workflow_status: %i[order_received order_processing order_shipped order_cancelled]
end
