class Product < ApplicationRecord
  belongs_to :seller
  has_many :cart_details
  has_many :order_details
end
