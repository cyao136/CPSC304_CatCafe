class Transaction < ApplicationRecord

	# Find transaction with id = id
	def find(id)
		results = ActiveRecord::Base.connection.execute("SELECT * FROM transactions WHERE (transactions.transactionId = " + id + ");" )
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
	
end
