# frozen_string_literal: true

class OrderRecipient < ApplicationRecord
  belongs_to :order
  belongs_to :recipient
end
