class Employee < ApplicationRecord

	# Find employee with id = id
	def find(int id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM employees WHERE (employees.employeeId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end

end
