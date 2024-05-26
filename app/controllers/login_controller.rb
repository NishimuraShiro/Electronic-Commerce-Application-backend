class LoginController < ApplicationController
    # POST /resource/sign_in
    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      
      render json: current_user, status: :ok
    end
  
    # カスタムアクションを追加する場合はここに記述
end
