# frozen_string_literal: true

class Recipient < ApplicationRecord
  belongs_to :school
  has_many :order_recipients, dependent: :destroy
  has_many :orders, through: :order_recipients

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
end
