class Member < ApplicationRecord

	# Find member with id = id
	def self.findById(id)
		results = nil
		sqlQuery = "SELECT * FROM Members WHERE MemberID = #{id};"
		begin  
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
  			end
 		rescue Exception => exc
   			raise exc;
 		end
 		return results.first
	end

	# Find member with email
	def self.findByEmail(email)
		results = nil
		sqlQuery = "SELECT * FROM Members WHERE Email = \'#{email}\';"
		begin  
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
  			end
 		rescue Exception => exc
   			raise exc;
 		end
 		return results.first
	end

	def self.login(email, password)
		results = nil
		sqlQuery = "SELECT * FROM Members WHERE Email = \'#{email}\' AND MPassword = \'#{password}\';"
		begin  
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
  			end
 		rescue Exception => exc
   			raise exc;
 		end
 		return results.first
	end

	def self.create(mname, phonenum, email, mpassword)
		results = nil
		sqlQuery = "INSERT INTO Members (MName, PhoneNum, Email, MPassword) VALUE " 
		sqlQuery = sqlQuery + "(\'#{mname}\', \'#{phonenum}\', \'#{email}\', \'#{mpassword}\');"
		begin
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
  			end
 		rescue Exception => exc
   			raise exc;
 		end
 		return results
	end

	def self.edit(id, mname, phonenum, email, mpassword)
		results = nil
		addComma = false
		sqlQuery = "UPDATE Members SET "
		if (!mname.nil?)
			sqlQuery = sqlQuery + "MName = \'" + mname + "\'"
			addComma = true
		end
		if (!phonenum.nil?)
			if (addComma)
				sqlQuery = sqlQuery + ", "
			end
			sqlQuery = sqlQuery + "PhoneNum = \'" + phonenum + "\'"
			addComma = true
		end
		if (!email.nil?)
			if (addComma)
				sqlQuery = sqlQuery + ", "
			end
			sqlQuery = sqlQuery + "Email = \'" + email + "\'"
			addComma = true
		end
		if (!mpassword.nil?)
			if (addComma)
				sqlQuery = sqlQuery + ", "
			end
			sqlQuery = sqlQuery + "MPassword = \'" + mpassword + "\'"
			addComma = true
		end
		sqlQuery = sqlQuery + " WHERE MemberID = #{id};"

		begin  
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
  			end
 		rescue Exception => exc
   			raise exc;
 		end
 		return results
	end

	def self.destroy(id)
		results = nil
		sqlQuery = "DELETE FROM Members WHERE MemberID = #{id};"

		begin  
  			ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
  			end
 		rescue Exception => exc
   			raise exc;
 		end
 		return results
 	end
end
