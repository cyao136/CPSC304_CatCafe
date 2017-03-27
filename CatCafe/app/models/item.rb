class Item < ApplicationRecord\

	# Find item with id = id
	def find(int id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM items WHERE (items.itemId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end

end
