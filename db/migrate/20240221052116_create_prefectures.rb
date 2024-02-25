class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.string :name
      t.integer :area_id

      t.timestamps
    end
  end
end
