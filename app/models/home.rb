class Home < ApplicationRecord
  has_one_attached :image


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
end
