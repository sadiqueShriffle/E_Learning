class SubscriptionsController < ApplicationController
  before_action :set_user 
  before_action :find_subscription, only: [:show]
  before_action :check_student , only: [:create ,:update, :destroy , :index]


 
  def index
    @sub = @user.subscriptions
    render json: @sub
  end


  def show
    if @sub.user == @user
      @course = @sub.course
      render json: @course,include: {chapters: {include: :practice_questions}}
    else
      render json: {error: 'Unauthorized'}, status:401
    end
end


def create
  @sub = @user.subscriptions.new(subscribe_param)
  if @sub.save
    render json: @sub, status:200
  else
    render json: "Error while subscribign", status:404
  end
end

  def destroy
    @sub.destroy
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def subscribe_param
    params.permit([
    :course_id,
    :subscription_date,
    :expiration_date
    ]
    )
  end

  def find_subscription
  @sub = Subscription.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {error: 'Subscription not found'} , status:404
  end

  def check_student
    unless @user.student?
      render json: { error: "Only Student is Authorized to perform action"}, status:401
      
    end
  end


end
