# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    school { nil }
    workflow_status { 1 }
  end
end
