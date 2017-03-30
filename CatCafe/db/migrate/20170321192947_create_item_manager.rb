class CreateItemManager < ActiveRecord::Migration[5.0]
  def change
      create_table :item_managers do |t|
      end
      rename_column :item_managers, :id, :OrderID
  end
end
