class Category < ApplicationRecord
  acts_as_nested_set
  has_many :products, dependent: :destroy

  validates :name, presence: true, length: { maximum: 100 },
                   uniqueness: { case_sensitive: false }
end
