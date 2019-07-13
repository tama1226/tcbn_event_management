class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :reserved_name, null: false
      t.string :name, null: false
      t.string :phone_number, null: false
      t.datetime :reserved_on, null: false
      t.string :game
      t.datetime :utilization_at
      t.string :number_of_people
      t.string :lane, null: false
      t.boolean :bus, null: false
      t.boolean :meeting_room, null: false
      t.text :remarks

      t.timestamps
    end
  end
end
