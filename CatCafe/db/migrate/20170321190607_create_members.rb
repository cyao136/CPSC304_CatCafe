class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
          
          t.text :MName, null: false
          t.text :MPassword, null: false
          t.string :Email, null: false, :limit => 255
          t.text :PhoneNum, null: false

          t.index :Email, unique: true
          
        t.timestamps
    end
    rename_column :members, :id, :MemberID
  end
end
