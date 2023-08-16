class SubscriptionsController < ApplicationController
  before_action :set_user

 
  def index
    if @user.student?
      @subscriptions = @user.subscriptions
      render json: @subscriptions
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

  def create
    @course = Course.find(params[:course_id])
    
    if current_user.student? && !current_user.subscribed_courses.include?(@course)
      current_user.subscribed_courses << @course
      render json: { message: 'Subscribed successfully' }
    else
      render json: { error: 'Subscription failed' }, status: :unprocessable_entity
    end
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
