class Cat < ApplicationRecord

	# Find cat with id = id
	def find(id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM cats WHERE (cats.catId = " + id + ");" )
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

	# Return a list of cats foster by employee with id employeeId
	def fosteredBy(employeeId)
	end

end
