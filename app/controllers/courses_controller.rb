class CoursesController < ApplicationController
  before_action :set_user
  before_action :check_teacher, only: [:index ,:create ,:update, :destroy , :show]

  def index
    @course = @user.courses
    render json: @course
  end

  def show
    @course = @user.courses.find(params[:id]) 
    render json: @course
  end

  def create
     @course = @user.courses.new(course_param)
    if @course.save
      render json: @course , status:200
    else
      render json: "Error" , status:404
    end
  end


  def update
     @course = @user.courses.find(params[:id]) 

    if @course
      @course.update!(course_param) 
     render json: "User Record Updated Succesfully" , status: 200
    else
    render json: {
      error: "User Not found"
    }
  end
  end


  def destroy
    @course = @user.courses.find(params[:id]) 
    if @course
      @course.destroy
    render json: 'Course Deleted Successfully' , status:200
    else
      render json: { error: 'Invalid Course Id' } , status:404
    end
  end


  def set_user
  @user = User.find_by(id: params[:user_id]) 
  end

  def course_param
  params.permit([
    :course_name,
    :description, 
  ]
  )
  end


  private
  def check_teacher
    unless @user.teacher?
      render json: { error: "Only Teacher is Authorized to perform action"}, status:401
      
    end
  end

end




