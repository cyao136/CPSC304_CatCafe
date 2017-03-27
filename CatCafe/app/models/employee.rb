class Employee < ApplicationRecord

	# Find employee with id = id
	def find(id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM employees WHERE (employees.employeeId = " + id + ");" )
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

	def isManager
	end

end
