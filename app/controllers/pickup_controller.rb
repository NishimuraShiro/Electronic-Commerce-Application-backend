class PickupController < ApplicationController
  def index
    # Productテーブルからランダムに8つの要素を取得
    random_products = Product.order('RANDOM()').limit(8)

    response = random_products.result.includes(:seller, order_details: :review)

    # JSON形式のレスポンスを返す
    render json: response , include: [:seller, order_details: :review ]
  end
end
