class TopsController < ApplicationController

  def index
  end

  def ask_approve
    new_teacher = Teacher.find_by(id: params[:new_teacher_id])
    old_teacher = Teacher.find_by(id: params[:old_teacher_id])
    if old_teacher.nil?
      render json: "error"
    else
      UserMailer.ask_approve(old_teacher, new_teacher).deliver_now
      render json: "success"
    end
  end

  def search_teacher
    ret = []
    Teacher.where("name LIKE ? OR name_kana LIKE ?", "#{params[:name]}%", "#{params[:name_kana]}%").where(is_authenticated: true).order(:id).each do |teacher|
      ret.push(teacher.hash_format)
    end
    render json: ret
  end

  def update_grade
    remote_ip = request.remote_ip
    logger.info remote_ip
  end

end
