class Booking < ApplicationRecord

	# Find booking with id = id
	def find(int id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM bookings WHERE (bookings.bookingId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end

end
