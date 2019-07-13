class ChangeDataReservedOnAndUtilizationAtToContacts < ActiveRecord::Migration[5.2]
  def change
    change_column :contacts, :reserved_on, :date
    change_column :contacts, :utilization_at, :string
  end
end
