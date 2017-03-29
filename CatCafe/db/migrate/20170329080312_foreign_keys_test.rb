class ForeignKeysTest < ActiveRecord::Migration[5.0]
  def change
      add_reference :bookings, :bookingmember, references: :members, index: true
      add_foreign_key :bookings, :members, column: :bookingmember_id, primary_key: :MemberID, on_delete: :cascade
      
      add_reference :bookings, :bookingroom, references: :rooms, index: true
      add_foreign_key :bookings, :rooms, column: :bookingroom_id, primary_key: :RoomID, on_delete: :cascade
  end
end
