class ViewcartController < ApplicationController
  def get_customer_cart_details
    # パラメータからcustomer_idを取得
    customer_id = params[:customer_id].to_i

    # customer_idを持つcartレコードを取得
    carts = Cart.where(customer_id: customer_id)

    # 取得したcartのcart_idを取得
    cart_ids = carts.pluck(:cart_id)

    # cart_idsを持つCartDetailレコードを取得
    cart_details = CartDetail.where(cart_id: cart_ids)

    render json: { cart_details: cart_details }, status: :ok
  end
end
