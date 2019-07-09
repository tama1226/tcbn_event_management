class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.datetime :start_on, null: false
      t.string :price
      t.string :game
      t.string :lane, null: false
      t.text :remarks
      t.text :image
      
      t.timestamps
    end
  end
end
