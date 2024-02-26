class School < ApplicationRecord
  
  validates :name, presence: :true
  validates :school_id, presence: :true
  validates :prefecture_id, presence: :true
  validates :name, uniqueness: true
  validates :school_id, uniqueness: :true

  def hash_format
    return {id: self.id, name: self.name}
  end
  
end
