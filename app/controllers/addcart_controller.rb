class AddcartController < ApplicationController
  def new
    # パラメータからcart_idを取得
    cart_id = params[:id].to_i
    # cart_idを使用して、既存のカートを検索または新規作成
    @cart = Cart.find_or_create_by(id: cart_id)

    # パラメータからproduct_idを取得
    product_id = params[:product_id].to_i
    # product_idを使用して、商品を検索
    product = Product.find(product_id)

    # パラメータからnum数値を取得（整数に変換）
    num = params[:num].to_i

    # CartDetailを作成して外部キーを設定
    cart_detail = CartDetail.new(
      cart: @cart,
      product: product,
      num: num
    )

    @carts = @q.result.includes(:customer, :cart_detail) # :association_name は外部キーの関連名を指定

    render json: @cart, include: [:customer, :cart_detail]

  end
end
