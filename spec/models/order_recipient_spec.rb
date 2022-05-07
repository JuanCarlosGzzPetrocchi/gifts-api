# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrderRecipient, type: :model do
  it { should belong_to :order }
  it { should belong_to :recipient }
end
