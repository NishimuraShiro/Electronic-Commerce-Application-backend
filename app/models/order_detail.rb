class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product
  has_one :review
end
