class Member < ApplicationRecord

	# Find member with id = id
	def findById(id)
		results = nil
		sqlQuery = "SELECT * FROM Members WHERE (MemberID = " + id + ");"
		begin  
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.execute(sqlQuery)
  			end
 		rescue Exception => exc
   			return exc;
 		end
 		return results
	end

	# Find member with email
	def findByEmail(Email)
		results = nil
		sqlQuery = "SELECT * FROM Members WHERE (Email = " + Email + ");"
		begin  
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.execute(sqlQuery)
  			end
 		rescue Exception => exc
   			return exc;
 		end
 		return results
	end

	#TODO create and edit should have their respective params
	def create(MName, PhoneNum, Email, MPassword)
		results = nil
		sqlQuery = "INSERT INTO Members (MName, PhoneNum, Email, MPassword) VALUE " 
		sqlQuery = sqlQuery + "(" MName + "," + PhoneNum + "," + Email + "," + MPassword + ");"
		begin
  			ActiveRecord::Base.transaction do
				result = ActiveRecord::Base.connection.execute(sqlQuery)
  			end
 		rescue Exception => exc
   			return exc;
 		end
 		return results
	end

	def edit(MemberID, MName, PhoneNum, Email, MPassword)
		results = nil
		sqlQuery = "UPDATE Members SET "
		if (!MName.nil?)
			sqlQuery = sqlQuery + "MName = \'" + MName + "\', "
		end
		if (!PhoneNum.nil?)
			sqlQuery = sqlQuery + "PhoneNum = \'" + PhoneNum + "\', "
		end
		if (!Email.nil?)
			sqlQuery = sqlQuery + "Email = \'" + Email + "\', "
		end
		if (!MPassword.nil?)
			sqlQuery = sqlQuery + "MPassword = \'" + MPassword + "\' "
		end
		sqlQuery = sqlQuery + "WHERE MemberID = " + MemberID + ";"

		begin  
  			ActiveRecord::Base.transaction do
				result = ActiveRecord::Base.connection.execute(sqlQuery)
  			end
 		rescue Exception => exc
   			return exc;
 		end
 		return results
	end

	def destroy(MemberID)
		results = nil
		sqlQuery = "DELETE FROM Members WHERE MemberID = " + MemberID + ";"

		begin  
  			ActiveRecord::Base.transaction do
				result = ActiveRecord::Base.connection.execute(sqlQuery)
  			end
 		rescue Exception => exc
   			return exc;
 		end
 		return results
 	end
end
