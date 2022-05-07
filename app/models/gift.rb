# frozen_string_literal: true

class Gift < ApplicationRecord
  has_many :order_gifts, dependent: :destroy
  has_many :orders, through: :order_gifts
  enum gift_type: { mug: 0, t_shirt: 1, hoodie: 2, sticker: 3 }
end
