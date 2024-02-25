class Testbook < ApplicationRecord
  validates :name, uniqueness: true
  validates :name_kana, presence: :true
end
