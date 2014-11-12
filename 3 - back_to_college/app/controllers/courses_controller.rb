class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def show
    @course = Course.find_by_id(params[:id])
    @students = @course.students
  end

  def edit
    @course = Course.find_by_id(params[:id])
  end

  def create
    course = Course.new(course_params)
    course.save
    redirect_to courses_path
  end

  def update
    course = Course.find_by_id(params[:id])
    course.update_atrributes(course_params)
    redirect_to courses_path
  end

  def destroy
    course = Course.find_by_id(params[:id])
    course.destroy
    redirect_to courses_path
  end

  private
  def course_params
    params.require(:course).permit(:name)
  end
end
