class CoursesController < ApplicationController
  before_action :set_user
  before_action :set_course, only: [:new,:show, :edit, :update, :destroy ]
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

def new
  @course = @user.courses.new
  @course.chapters.build
  @course.chapters.each { |chapter| chapter.practice_questions.build }
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
    @course = @user.courses.new(course_params)
    if @course.save
      render json: @course , status:200
    else
      
      render json: "Error" , status:404
    end
  end


  def update
      if @course.update!(course_params) 
      render json: "User Record Updated Succesfully" , status: 200
      else
      render json: {
        error: "User Not found"
      }
      end
  end


  def destroy
    if  @course.destroy
    render json: 'Course Deleted Successfully' , status:200
    else
      render json: { error: 'Invalid Course Id' } , status:404
    end
  end

 


  private
  def course_params
    params.require(:course).permit(:course_name, 
      :description,
       chapters_attributes:[
      
        :chapter_name ,
         practice_questions_attributes: [
         
          :question, 
          :correct_ans]])
  end

  
  def check_teacher
    unless @user.teacher?
      render json: { error: "Only Teacher is Authorized to perform action"}, status:401
      
    end
  end

  def set_course
    @course = Course.find(params[:id])
  end

  def set_user
    @user = User.find_by(id: params[:user_id]) 
    end

end

# {
#   "course": {
#     "course_name": "Course Title",
#     "description": "Course Description",
#     "chapters_attributes": [
#       {
#         "chapter_name": "Chapter 1",
#         "practice_questions_attributes": [
#           { "question": "Question 1", "correct_ans": "Answer 1" },
#           { "question": "Question 2", "correct_ans": "Answer 2" }
#         ]
#       },
#       {
#         "chapter_name": "Chapter 2",
#         "practice_questions_attributes": [
#           { "question": "Question 3", "correct_ans": "Answer 3" },
#           { "question": "Question 4", "correct_ans": "Answer 4" }
#         ]
#       }
#     ]
#   }
# }



