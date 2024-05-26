class RegisterController < ApplicationController
  def create_user
    # パラメータからメールアドレスとパスワードを取得
    email = params[:email]
    password = params[:password]

    # 新しいユーザーを作成
    @user = User.new(email: email, password: password)

    if @user.save
      # ユーザーの登録に成功した場合の処理
      sign_in @user  # ユーザーをサインイン状態にする（任意）
      render json: @user, status: :created
    else
      # ユーザーの登録に失敗した場合の処理
      render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
