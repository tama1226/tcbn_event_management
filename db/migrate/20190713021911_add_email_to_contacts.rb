class AddEmailToContacts < ActiveRecord::Migration[5.2]
  def change
    add_column :contacts, :email, :string, null: false
  end
end
