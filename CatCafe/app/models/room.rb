class Room < ApplicationRecord

	# Find room with id = id
	def find(int id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM rooms WHERE (rooms.roomId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end

end
