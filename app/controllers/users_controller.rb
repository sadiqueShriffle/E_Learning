class UsersController < ApplicationController
  before_action :set_user 

 def index
    @user = User.all
    render json: @user, status:200
    # redirect_to courses_url()
  end


  def show
    if @user
      render json: @user , status:200
    else
      render json: {
        error: "User Not Found"
      }
    end
  end


  def create
    @user = User.create(user_param)
    if @user.save!
      render json: @user , status: 200
    else
      render json: {
        error: "Error Creating.."
      }
    end
  end


  def update
    if @user
      @user.update!(user_param) 
     render json: "User Record Updated Succesfully" , status: 200
    
  else
    render json: {
      error: "User Not found"
    }
  end
  end



  def destroy
    if @user
    @user.destroy
    render json: 'User Deleted Successfully' ,status: 200
    else
    render json: {
      error: "User Not Found"
    } 
    end
  end


  private 
  def user_param
  params.permit([
    :first_name,
    :last_name, 
    :username,
    :email,
    :password,
    :user_type,
    :profile_picture
  ]
  )
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

end
