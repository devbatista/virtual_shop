require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_many(:carts) }
  it { should have_many(:orders) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should define_enum_for(:role).with_values(%i[customer admin]) }
end