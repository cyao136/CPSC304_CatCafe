class Employee < ApplicationRecord


    # Find employees
    with id = id
    def self.findById(id)
        results = nil
        sqlQuery = "SELECT * FROM Employees WHERE EmployeeID = #{id};"
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
    def self.create(ename, epassword)
        results = nil
        sqlQuery = "INSERT INTO Employees (EName, EPassword) VALUE "
        sqlQuery = sqlQuery + "(\'" + ename + "\', \'" + epassword + "\');"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
        rescue Exception => exc
            return exc;
        end
        return results
    end

    def self.edit(id, ename, epassword)
        results = nil
        addComma = false
        sqlQuery = "UPDATE Employees SET "
        if (!ename.nil?)
            sqlQuery = sqlQuery + "EName = \'" + ename + "\'"
            addComma = true
        end
        if (!epassword.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "EPassword = \'" + epassword + "\'"
            addComma = true
        end
        sqlQuery = sqlQuery + " WHERE EmployeeID = #{id};"

        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
        rescue Exception => exc
            return exc;
        end
        return results
    end

    def self.destroy(id)
        results = nil
        sqlQuery = "DELETE FROM Employees WHERE EmployeeID = #{id};"

        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
        rescue Exception => exc
            return exc;
        end
        return results
    end

    # return true if employeeid is a managerid??
	def self.isManager(id)
        results = nil
        sqlQuery = "SELECT * FROM Employees WHERE EmployeeID = #{id};"
        
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
            rescue Exception => exc
            return exc;
        end
        return results
	end
end
