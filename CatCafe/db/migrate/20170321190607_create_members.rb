class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
          
          t.text :MName, null: false
          t.text :MPassword, null: false
          t.text :Email, unique: true, null: false
          t.text :PhoneNum, null: false
          
        t.timestamps
    end
    rename_column :members, :id, :MemberID
  end
end
