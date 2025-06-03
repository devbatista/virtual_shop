require "rails_helper"

RSpec.describe Product, type: :model do
  it { should have_many(:cart_items) }
  it { should have_many(:order_items) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  it { should validate_presence_of(:stock) }
  it { should validate_numericality_of(:stock).only_integer.is_greater_than_or_equal_to(0) }

  describe "category association" do
    it "belongs to a category" do
      category = Category.create!(name: "Books")
      product = Product.create!(name: "Ruby Book", price: 50, stock: 3, category: category)
      expect(product.category).to(eq(category))
    end

    it "is invalid without a category" do
      product = Product.new(name: "No Category", price: 10, stock: 1, category: nil)
      expect(product.valid?).to(be_falsey)
      expect(product.errors[:category]).to(include("must exist"))
    end
  end
end