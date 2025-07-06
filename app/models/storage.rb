class Storage < ApplicationRecord
  VALID_STORAGES = ["256GB", "512GB", "1TB", "2TB"]

  validates :value, presence: true, inclusion: { in: VALID_STORAGES }
end
