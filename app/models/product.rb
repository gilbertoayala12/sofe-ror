class Product < ApplicationRecord

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  scope :meal, -> { where(product_type: :meal) }
  scope :dessert, -> { where(product_type: :dessert) }

  def self.types
    %w(dessert meal)
  end

  # All of our product includes a fixed fee for delivery and drinks are included
  def delivery
    50
  end

  def drinks
    rand(22..86)
  end

  def total
    price + drinks + delivery
  end
  
  
end
