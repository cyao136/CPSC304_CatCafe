class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
        
        t.text :EName, null: false
        t.text :EPassword, null: false

    end
    rename_column :employees, :id, :EmployeeID
  end
end
