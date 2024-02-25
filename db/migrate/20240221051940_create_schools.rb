class CreateSchools < ActiveRecord::Migration[7.0]
  def change
    create_table :schools do |t|
      t.string :name
      t.integer :school_id
      t.integer :prefecture_id

      t.timestamps
    end
  end
end
