class CoursesController < ApplicationController
  before_action :set_user
  before_action :check_teacher, only: [:create ,:update, :destroy]

  def index
    if @user.student?
      @course = Course.all
      render json: @course
    else
    @course = @user.courses
    render json: @course
  end
end

 
  def show
    if @user.student?
      @course = Course.find(params[:id])
      render json: @course.slice(:id, :course_name, :description)  
    else
    @course = Course.includes(chapters: :practice_questions).find(params[:id])
    render json: @course, include: { chapters: { include: :practice_questions } }
    end
    rescue ActiveRecord::RecordNotFound
    render json: { error: 'Course not found' }, status:404
  end


  def create
    @course = @user.courses.new(course_param)
    byebug
    if @course.save
      render json: @course , status:200
    else
      byebug
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
    params.permit(:course_name, :description, chapters_attributes:[:course_id,:chapter_name , practice_questions_attributes: [:chapter_id,:question, :correct_ans]])
  end

  private
  def check_teacher
    unless @user.teacher?
      render json: { error: "Only Teacher is Authorized to perform action"}, status:401
      
    end
  end

end




