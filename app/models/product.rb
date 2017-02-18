class Product < ApplicationRecord
  has_attached_file :image, styles: { medium: "600x600>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  serialize :price, Hash

  belongs_to :category
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
