class ForeignKeys < ActiveRecord::Migration[5.0]
  def change
      
      add_reference :transactions, :EmployeeID, references: :employees, index: true
      add_foreign_key :transactions, :employees, column: :EmployeeID_id, primary_key: :EmployeeID, on_delete: :cascade
      
      add_reference :managers, :EmployeeID, references: :employees, index: true
      add_foreign_key :managers, :employees, column: :EmployeeID_id, primary_key: :EmployeeID, on_delete: :cascade
      
      add_reference :cats, :employee, references: :employees, index: true
      add_foreign_key :cats, :employees, column: :employee_id, primary_key: :EmployeeID, on_delete: :cascade
      
      add_reference :adoptions, :member, references: :members, index: true
      add_foreign_key :adoptions, :members, column: :member_id, primary_key: :MemberID, on_delete: :cascade
      
      add_reference :adoptions, :employee, references: :employees, index: true
      add_foreign_key :adoptions, :employees, column: :employee_id, primary_key: :EmployeeID, on_delete: :cascade
      
      add_reference :item_transactions, :transaction, references: :transactions, index: true
      add_foreign_key :item_transactions, :transactions, column: :transaction_id, primary_key: :TransactionID, on_delete: :cascade
      
      add_reference :item_transactions, :item, references: :items, index: true
      add_foreign_key :item_transactions, :items, column: :item_id, primary_key: :ItemID
      
      add_reference :item_managers, :manager, references: :managers, index: true
      add_foreign_key :item_managers, :managers, column: :manager_id, primary_key: :ManagerID, on_delete: :cascade
      
      add_reference :item_managers, :item, references: :items, index: true
      add_foreign_key :item_managers, :items, column: :item_id, primary_key: :ItemID, on_delete: :cascade
      
  end
end
