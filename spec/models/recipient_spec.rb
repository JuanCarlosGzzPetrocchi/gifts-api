# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipient, type: :model do
  it { should respond_to :name }
  it { should respond_to :address }

  it { should belong_to :school }
  it { should have_many :orders }
end
