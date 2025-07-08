class ProductStock < ApplicationRecord
  belongs_to :product
  belongs_to :color, optional: true
  belongs_to :storage, optional: true

  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
  validates :color_id, 
            uniqueness: { 
              scope: [:product_id, :storage_id],
              message: 'already exists for this product and storage' 
            }
  validates :product, presence: true
end
