class ViewaccountController < ApplicationController
  def get_customer
    # パラメータからcustomer_idを取得
    customer_id = params[:customer_id].to_i

    # customer_idを持つCustomerレコードを取得
    @customer = Customer.find_by(id: customer_id)

    if @customer
      render json: @customer, status: :ok
    else
      render json: { error: "指定されたCustomerが見つかりません" }, status: :not_found
    end
  end
end
