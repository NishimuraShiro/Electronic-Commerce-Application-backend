def create
  # パラメータからcustomer_idを取得
  customer_id = params[:customer_id].to_i

  # customer_idを持つCartレコードを取得
  @cart = Cart.find_by(customer_id: customer_id)

  if @cart.present?
    # カート内の商品をOrderテーブルにコピー
    @cart.cart_items.each do |cart_item|
      order_item = OrderItem.new(
        customer_id: customer_id,
        product_id: cart_item.product_id,
        quantity: cart_item.quantity
      )
      order_item.save
    end

    # Cartレコードを削除
    @cart.destroy

    render json: { message: "カートの内容を注文にコピーしました" }, status: :ok
  else
    render json: { error: "指定されたカートが見つかりません" }, status: :not_found
  end
end