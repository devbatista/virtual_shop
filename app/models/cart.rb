class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  
  enum status: {
    active: "active",
    abandoned: "abandoned",
    ordered: "ordered",
    cancelled: "cancelled"
  }

  validates :status, presence: true
end
