class Category < ApplicationRecord
  belongs_to :parent, class_name: "Category", optional: true, foreign_key: "parent_id"
  has_many :subcategories, class_name: "Category", foreign_key: "parent_id"
end
