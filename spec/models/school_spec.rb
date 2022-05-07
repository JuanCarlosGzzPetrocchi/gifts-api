require 'rails_helper'

RSpec.describe School, type: :model do
  it { should respond_to :name }
  it { should respond_to :address }

  it { should have_many :recipients }
  it { should have_many :orders }
end
