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
	def findByEmail(email)
		results = nil
		sqlQuery = "SELECT * FROM Members WHERE (Email = " + email + ");"
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
	def create(mname, phonenum, email, mpassword)
		results = nil
		sqlQuery = "INSERT INTO Members (MName, PhoneNum, Email, MPassword) VALUE " 
		sqlQuery = sqlQuery + "(" mname + "," + phonenum + "," + email + "," + mpassword + ");"
		begin
  			ActiveRecord::Base.transaction do
				result = ActiveRecord::Base.connection.execute(sqlQuery)
  			end
 		rescue Exception => exc
   			return exc;
 		end
 		return results
	end

	def edit(id, mname, phonenum, email, mpassword)
		results = nil
		sqlQuery = "UPDATE Members SET "
		if (!mname.nil?)
			sqlQuery = sqlQuery + "MName = \'" + mname + "\', "
		end
		if (!phonenum.nil?)
			sqlQuery = sqlQuery + "PhoneNum = \'" + phonenum + "\', "
		end
		if (!email.nil?)
			sqlQuery = sqlQuery + "Email = \'" + email + "\', "
		end
		if (!mpassword.nil?)
			sqlQuery = sqlQuery + "MPassword = \'" + mpassword + "\' "
		end
		sqlQuery = sqlQuery + "WHERE MemberID = " + id + ";"

		begin  
  			ActiveRecord::Base.transaction do
				result = ActiveRecord::Base.connection.execute(sqlQuery)
  			end
 		rescue Exception => exc
   			return exc;
 		end
 		return results
	end

	def destroy(id)
		results = nil
		sqlQuery = "DELETE FROM Members WHERE MemberID = " + id + ";"

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
