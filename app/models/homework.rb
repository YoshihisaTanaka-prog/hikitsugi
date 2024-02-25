class Homework < ApplicationRecord

  validates :main_id, uniqueness: { scope: :textbook_id }

  belongs_to :main
  belongs_to :textbook, class_name: "Testbook"

end
