# frozen_string_literal: true

class School < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :recipients, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true, uniqueness: true
end
