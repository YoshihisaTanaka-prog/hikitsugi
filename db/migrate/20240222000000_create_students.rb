class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :name_hurigana
      t.integer :grade
      t.string :personality
      t.integer :attitude
      t.integer :level
      t.integer :school_id
      t.string :how_to_focus
      t.text :supplement
      t.string :goal

      t.timestamps
    end
  end
end
