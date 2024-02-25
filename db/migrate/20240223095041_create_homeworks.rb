class CreateHomeworks < ActiveRecord::Migration[7.0]
  def change
    create_table :homeworks do |t|
      t.integer :main_id
      t.integer :textbook_id
      t.string :amount

      t.timestamps
    end
  end
end
