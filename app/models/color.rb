class Color < ApplicationRecord
  validates :name, presence: true
  validates :hex, presence: true, format: { with: /\A#(?:[0-9a-fA-F]{3}){1,2}\z/ }
end