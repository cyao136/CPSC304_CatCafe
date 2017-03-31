class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
       
        t.boolean :Status

    end
    rename_column :rooms, :id, :RoomID
  end
end
