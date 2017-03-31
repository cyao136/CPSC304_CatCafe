class Transaction < ApplicationRecord

	# Find transaction with id = id
    def self.findById(id)
        results = nil
        sqlQuery = "SELECT * FROM Transactions WHERE TransactionID = #{id};"
        begin
            ActiveRecord::Base.transaction do
                        results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end

    def self.findByReferenceId(referenceid)
        results = nil
        sqlQuery = "SELECT * FROM Transactions WHERE ReferenceID = \'" + referenceid + "\';"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end

    #TODO create and edit should have their respective params
    def self.create(referenceid, type, totalpayment, time, employeeid)
        results = nil
        sqlQuery = "INSERT INTO Transactions (ReferenceID, Type, TotalPayment, Time, EmployeeID) VALUE "
        sqlQuery = sqlQuery + "(\'#{referenceid}\', \'#{type}\', #{totalpayment}, \'#{time}\', #{employeeid});"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.edit(id, referenceid, type, totalpayment, time, employeeid)
        results = nil
        addComma = false
        sqlQuery = "UPDATE Transactions SET "
        if (!referenceid.nil?)
            sqlQuery = sqlQuery + "ReferenceID = \'" + referenceid + "\'"
            addComma = true
        end
        if (!type.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "Type = \'" + type + "\'"
            addComma = true
        end
        if (!totalpayment.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "TotalPayment = #{totalpayment}"
            addComma = true
        end
        if (!time.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "Time = \'" + time + "\'"
            addComma = true
        end
        if (!employeeid.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "EmployeeID = #{employeeid}"
            addComma = true
        end
        sqlQuery = sqlQuery + " WHERE TransactionID = #{id};"

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
        sqlQuery = "DELETE FROM Transactions WHERE TransactionID = #{id};"

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
