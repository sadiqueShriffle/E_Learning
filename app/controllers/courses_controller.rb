class CoursesController < ApplicationController
  before_action :set_user

  def index
    @course = @user.courses
    render json: @course
  end

  def show
    @course = @user.courses.find(params[:id]) 
    render json: @course
  end

  def create
    @course = @user.courses.new(user_param)
    if @course.save
      render json: @course , status:200
    else
      render json: "Error" , status:404
    end
  end

  def update
     @course = @course.find(id: params[:id])
    if @course
      @course.update!(user_param) 
     render json: "User Record Updated Succesfully" , status: 200
    
  else
    render json: {
      error: "User Not found"
    }
  end

  end

  def destory
  end

  def set_user
  @user = User.find_by(id: params[:user_id]) 
end

  def user_param
  params.permit([
    :course_name,
    :description, 
  ]
  )
  end


end
