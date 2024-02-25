class CreateTestbooks < ActiveRecord::Migration[7.0]
  def change
    create_table :testbooks do |t|
      t.string :name
      t.string :name_kana

      t.timestamps
    end
  end
end
