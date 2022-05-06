class OrderRecipient < ApplicationRecord
  belongs_to :order
  belongs_to :recipient
end
