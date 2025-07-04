class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true, foreign_key: "parent_id"
  
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id", dependent: :destroy
  has_many :products

  validates :name, presence: true
  validates :name, uniqueness: { scope: :parent_id, message: "must be unique per parent category" }

  validate :cannot_be_own_parent

  scope :roots, -> { where(parent_id: nil) }
  scope :with_subcategories, -> { joins(:subcategories).distinct }

  before_destroy :cannot_delete_with_products

  def descendant_ids
    subcategories.flat_map { |c| [c.id] + c.descendant_ids }
  end

  def full_path(separator = " > ")
    parent ? "#{parent.full_path(separator)}#{separator}#{name}" : name
  end

  private

    def cannot_be_own_parent
      if parent_id.present? && (parent_id == id || descendant_ids.include?(parent_id))
        errors.add(:parent_id, "can't be itself or a descendant")
      end
    end

    def cannot_delete_with_products
      if products.exists?
        errors.add(:base, 'cannot delete if there is a product in that category')
        throw(:abort)
      end
    end
end
