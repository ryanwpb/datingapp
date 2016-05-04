class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by_email(params[:email])
     render text: request.env['omniauth.auth'].to_yaml
  end

  def destroy
     session[:user_id] = nil
     session[:user_type] = nil
     redirect_to login_path, notice: "You have been logged out!"
  end

  private

   def set_params
     params.require(:session).permit(:name, :email, :password)
   end
end
