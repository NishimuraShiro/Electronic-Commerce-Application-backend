class HistoryController < ApplicationController
  def get_customer_orders
    # パラメータからcustomer_idを取得
    customer_id = params[:customer_id].to_i

    # customer_idを持つOrderレコードを取得
    orders = Order.where(customer_id: customer_id)

    # 取得したOrderのorder_idを取得
    order_ids = orders.pluck(:id)

    # order_idsを持つOrderDetailレコードを取得
    order_details = OrderDetail.where(order_id: order_ids)

    # JSONでレスポンスを返す
    render json: { orders: orders, order_details: order_details }, status: :ok
  end
end
