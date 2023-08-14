class ChaptersController < ApplicationController
  before_action :set_course

  
  
  def show
    @chapter = @course.chapters
    render json: @chapter , status:200
  end

  def index
    
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  def set_course
  @course = Course.find(params[id:])
  end
end
