class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0}

  before_save :decrement_product_stock

  private

    def decrement_product_stock
      if will_save_change_to_quantity?
        old_quantity, new_quantity = quantity_change_to_be_saved
        diff = (new_quantity || 0) - (old_quantity || 0)
        
        if product.stock >= diff
          product.stock -= diff
          product.save!
        else
          errors.add(:quantity, "is greater than available stock")
          throw(:abort)
        end
      end
    end
end
