class Api::V1::UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user, status:200
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: user , status:200
    else
      render json: {
        error: "User Not Found"
      }
    end
  end


  def create
    user = User.new(user_param)
    if user.save
      render json: user , status: 200
    else
      render json: {
        error: "Error Creating.."
      }
    end
  end


  def update
    user = User.find_by(id: params[:id])
    if user
      user.update(user_param) 
     render json: "User Record Updated Succesfully" , status: 200
    
  else
    render json: {
      error: "User Not found"
    }
  end
  end

  def destroy
    user = User.find_by(id: params[:id])
    if user
    user.destroy
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



end

# .require(:user)

