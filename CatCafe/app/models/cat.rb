class Cat < ApplicationRecord

	# Find cat with id = id
	def find(int id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM cats WHERE (cats.catId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end

end
