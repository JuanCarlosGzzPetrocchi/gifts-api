# frozen_string_literal: true

class OrderGift < ApplicationRecord
  belongs_to :order
  belongs_to :gift
end
