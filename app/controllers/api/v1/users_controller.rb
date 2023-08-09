class Api::V1::UsersController < ApplicationController

  def index
    @user = User.all
    render json: @user, status:200
  end

  def create
    user  = User.find_by(id: params[:id])
    if user
      render json: user, status:200
    else
      render json: {errors: "Not Found"}
    end
  end


  def update
  end

  def delete
  end

  private
  def user_param
  params.require(:user).permit([:first_name, :uername])
  end

end
