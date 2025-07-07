class ProductStock < ApplicationRecord
  belongs_to :product
  belongs_to :color, optional: true
  belongs_to :storage, optional: true
end
