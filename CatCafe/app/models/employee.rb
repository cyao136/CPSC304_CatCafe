class Employee < ApplicationRecord


    # Find employees with id = id
    def self.findById(id)
        results = nil
        sqlQuery = "SELECT * FROM Employees WHERE EmployeeID = #{id};"
        begin
            ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end

    def self.login(id, password)
        results = nil
        sqlQuery = "SELECT * FROM Employees WHERE EmployeeID = \'#{id}\' AND EPassword = \'#{password}\';"
        begin  
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end

    def self.manager?(id)
        results = nil
        sqlQuery = "SELECT * FROM Employees WHERE Employees.EmployeeID IN (SELECT EmployeeID FROM Managers WHERE Managers.EmployeeID = #{id});"
        
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
            rescue Exception => exc
            raise exc;
        end
        return !results.empty?
    end

    def self.create(ename, epassword)
        results = nil
        sqlQuery = "INSERT INTO Employees (EName, EPassword) VALUE "
        sqlQuery = sqlQuery + "(\'#{ename}\', \'(epassword)\');"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
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
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.destroy(id)
        results = nil
        sqlQuery = "DELETE FROM Employees WHERE EmployeeID = #{id};"

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
