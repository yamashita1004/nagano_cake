class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre

  def get_image
    if image.attached?
      image
    else
      'no_omage.jpg'
    end
  end
  def add_tax_sales_price
    (self.price * 1.10).round
  end
end