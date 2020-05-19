class ProfileController < ApplicationController
  before_action :set_user, only: :index

  def index
    if user_signed_in?
      if current_user.id == @user.id
        @subscriptions = current_user.subscriptions
      else
        redirect_to root_path
      end
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
