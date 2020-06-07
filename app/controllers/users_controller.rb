class UsersController < ApplicationController
  before_action :set_user, only: :api_token
  
  def api_token
    if user_signed_in?
      @api_token = @user.api_token
    else
      redirect_to root_path
    end
  end
  
  private
  
  def set_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path if @user.nil?
  end
end
