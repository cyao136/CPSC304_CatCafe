class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
        
        t.string :Name, null: false
        t.integer :Price, null: false

    end
    rename_column :items, :id, :ItemID
  end
end
