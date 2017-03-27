class Transaction < ApplicationRecord

	# Find transaction with id = id
	def find(int id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM transactions WHERE (transactions.transactionId = " + id + ");" )
		if results.present?
			return results.first
		else
			return nil
		end
	end
	
end
