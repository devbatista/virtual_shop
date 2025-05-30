require "rails_helper"

RSpec.describe Order, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:order_items).dependent(:destroy) }

  it { should validate_presence_of(:status) }
  it { should validate_presence_of(:total) }
  it { should validate_numericality_of(:total).is_greater_than_or_equal_to(0) }

  it "valid_statuses" do
  valid_statuses = %w[pending paid shipped delivered cancelled]
  valid_statuses.each do |status|
    order = Order.new(status: status, total: 10)
    order.validate
    expect(order.errors[:status]).to be_empty, "expected status '#{status}' to be valid"
  end

  expect {
    Order.new(status: "invalid", total: 10)
  }.to raise_error(ArgumentError)
end
end