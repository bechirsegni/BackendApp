class Product < ApplicationRecord
  belongs_to :category, dependent: :destroy
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true
end
