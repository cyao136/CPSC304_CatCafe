class Booking < ApplicationRecord

	# Find booking with id = id
	def find(id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM bookings WHERE (bookings.bookingId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end

	#TODO create and edit should have their respective params
	def create
	end

	def edit
	end

	# return bookings booked by member with Id memberId
	def bookedBy(memberId)
	end

end
