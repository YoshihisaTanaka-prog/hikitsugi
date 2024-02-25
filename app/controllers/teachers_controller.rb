class TeachersController < ApplicationController
  def index
    @teachers = Teacher.all.order(:name_kana)
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end

  def authentication
    teacher = Teacher.find_by(id: params[:id])
    unless teacher.nil?
      teacher.is_authenticated = !teacher.is_authenticated
      teacher.save
    end
    logger.debug teachers_url + "/" + params[:id]
    redirect_to teachers_url + "/" + params[:id]
  end
end
