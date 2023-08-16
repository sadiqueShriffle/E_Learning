class SubscriptionsController < ApplicationController
  before_action :set_user

  def index
  end

  def create
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_param
    params.permit([
    
    ]
    )
  end


end
