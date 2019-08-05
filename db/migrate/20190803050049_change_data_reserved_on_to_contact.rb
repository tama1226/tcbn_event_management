class ChangeDataReservedOnToContact < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :reserved_on, :datetime
  end
end
