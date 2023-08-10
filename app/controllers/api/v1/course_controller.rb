class Api::V1::CourseController < ApplicationController
  def index
    @course = Course.all
    render json: @course
  end

  def show
  end

  def create
  end

  def update
  end

  def destory
  end
end
