class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :chats

  def area
    p = Prefecture.find_by(id: self.school.prefecture_id) if self.school
    a = Arium.find_by(id: p.area_id) if p
    return a.id if a
  end

  def prefecture
    p = Prefecture.find_by(id: self.school.prefecture_id) if self.school
    return p.id if p
  end

  def school
    return School.find_by(id: self.school_id)
  end

  def hash_format
    if self.school.blank?
      return {id: self.id, name: self.name, school: ""}
    else
      return {id: self.id, name: self.name, school: self.school.name}
    end
  end

end
