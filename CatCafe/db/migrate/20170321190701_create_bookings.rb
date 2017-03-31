class CreateBookings < ActiveRecord::Migration[5.0]
    def change
        create_table :bookings do |t|
            
            t.time :FromTime, null: false
            t.time :ToTime, null: false
            t.date :Date, null: false

        end
        rename_column :bookings, :id, :BookingID
    end
end
