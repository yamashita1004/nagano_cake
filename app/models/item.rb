class Item < ApplicationRecord
  has_one_attached :image
   has_many :cart_items, dependent: :destroy


  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  def add_tax_sales_price
    (self.price * 1.10).round
  end
  def with_tax_price
    (price * 1.1).floor
  end
end