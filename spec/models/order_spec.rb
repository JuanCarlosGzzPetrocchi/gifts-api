# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  it { should respond_to :workflow_status }

  it { should have_many :recipients }
  it { should have_many :gifts }
end
