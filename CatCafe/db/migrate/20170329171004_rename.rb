class Rename < ActiveRecord::Migration[5.0]
  def change
      rename_column :bookings, :bookingmember_id, :MemberID
      rename_column :bookings, :bookingroom_id, :RoomID
      rename_column :transactions, :EmployeeID_id, :EmployeeID
      rename_column :managers, :EmployeeID_id, :EmployeeID
      rename_column :cats, :employee_id, :EmployeeID
      remove_column :adoptions, :id
      rename_column :adoptions, :member_id, :MemberID
      rename_column :adoptions, :employee_id, :EmployeeID
      rename_column :item_transactions, :id, :OrderID
      rename_column :item_transactions, :transaction_id, :TransactionID
      rename_column :item_transactions, :item_id, :ItemID
      remove_column :item_managers, :OrderID
      rename_column :item_managers, :manager_id, :ManagerID
      rename_column :item_managers, :item_id, :ItemID
  end
end
