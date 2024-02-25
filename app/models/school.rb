class School < ApplicationRecord

  def hash_format
    return {id: self.id, name: self.name}
  end
  
end
