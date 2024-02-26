class School < ApplicationRecord
  
  validates :name, presence: :true
  validates :school_id, presence: :true
  validates :prefecture_id, presence: :true

  def hash_format
    return {id: self.id, name: self.name}
  end
  
end
