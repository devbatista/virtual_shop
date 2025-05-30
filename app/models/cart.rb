class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  
  enum status: {
    active: 1,
    abandoned: 2,
    ordered: 3,
    cancelled: 0
  }

  validates :status, presence: true
end
