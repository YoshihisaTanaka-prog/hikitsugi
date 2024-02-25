class Main < ApplicationRecord

  belongs_to :student

  has_many :flows, dependent: :destroy
  accepts_nested_attributes_for :flows, reject_if: proc {|attributes| attributes['content'].blank?}, allow_destroy: true
  
  has_many :main_textbooks, dependent: :destroy
  accepts_nested_attributes_for :main_textbooks, reject_if: proc {|attributes| attributes['textbook_id'].blank?}, allow_destroy: true

  has_many :homeworks, dependent: :destroy
  accepts_nested_attributes_for :homeworks, reject_if: proc {|attributes| attributes['textbook_id'].blank?}, allow_destroy: true

  def textbooks_hash
    ret = {}
    self.main_textbooks.each do |mt|
      t = Testbook.find_by(id: mt.textbook_id)
      ret[t.id] = {id: mt.id, name: t.name, finished_place: mt.finished_place} if t
    end
    return ret
  end
  
  def homeworks_hash
    ret = {}
    self.homeworks.each do |h|
      t = Testbook.find_by(id: h.textbook_id)
      ret[t.id] = {id: h.id, name: t.name, amount: h.amount} if t
    end
    return ret
  end

  def student
    unless self.student_id.blank?
      return Student.find(self.student_id)
    else
      return Student.find(session[:student_id]) if session[:student_id]
    end
    return nil
  end

  def textbook_ids
    arr = []
    self.main_textbooks.each do |mt|
      arr.push(mt.textbook_id)
    end
    return arr
  end

  def homework_ids
    arr = []
    self.homeworks.each do |h|
      arr.push(h.textbook_id)
    end
    return arr
  end

end
