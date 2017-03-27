class Member < ApplicationRecord

	# Find member with id = id
	def find(int id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM members WHERE (members.memberId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end

end
