class CreateManagers < ActiveRecord::Migration[5.0]
  def change
      create_table :managers do |t|
      end
      rename_column :managers, :id, :ManagerID
  end
end
