class Category < ApplicationRecord
  acts_as_nested_set
  validates :name, presence: true, length: { maximum: 100 },
                   uniqueness: { case_sensitive: false }
end
