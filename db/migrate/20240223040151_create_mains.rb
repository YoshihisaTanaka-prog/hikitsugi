class CreateMains < ActiveRecord::Migration[7.0]
  def change
    create_table :mains do |t|
      t.integer :subject
      t.integer :student_id
      t.boolean :is_giving_answer
      t.text :supplement

      t.timestamps
    end
  end
end
