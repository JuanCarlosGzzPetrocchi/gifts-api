# frozen_string_literal: true

FactoryBot.define do
  factory :order_recipient do
    order { nil }
    recipient { nil }
  end
end
