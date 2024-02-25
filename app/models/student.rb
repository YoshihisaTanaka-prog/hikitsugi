class Student < ApplicationRecord

  validates :level, presence: :true
  validates :attitude, presence: :true
  has_many :mains, -> { order(updated_at: :desc) }

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

end
