class CreateMainTextbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :main_textbooks do |t|
      t.integer :main_id
      t.integer :textbook_id
      t.string :finished_place

      t.timestamps
    end
  end
end
