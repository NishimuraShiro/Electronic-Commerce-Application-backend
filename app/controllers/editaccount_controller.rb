class EditaccountController < ApplicationController
  def create
    # パラメータからcustomer_idを取得
    customer_id = params[:customer_id].to_i

    # customer_idを使用して該当のCustomerレコードを取得
    @customer = Customer.find(customer_id)

    # Customerレコードを編集（例: 名前やメールアドレスの変更など）
    @customer.name = params[:name]
    @customer.email = params[:email]

    # 保存が成功した場合
    if @customer.save
      render json: @customer, include: :user
    else
      render json: { error: "Customerの編集に失敗しました" }, status: :unprocessable_entity
    end
  end
end
