class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
        
        t.text :ReferenceID, null: false
        t.text :Type, null: false
        t.datetime :Time, null: false
        t.integer :TotalPayment, null: false
        
      t.timestamps
    end
    rename_column :transactions, :id, :TransactionID
  end
end
