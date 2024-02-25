class CreateFlows < ActiveRecord::Migration[7.0]
  def change
    create_table :flows do |t|
      t.integer :main_id
      t.integer :order
      t.string :content

      t.timestamps
    end
  end
end
