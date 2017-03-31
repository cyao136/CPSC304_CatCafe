class Cat < ApplicationRecord

	# Find cat with id = id
    def self.findById(id)
        results = nil
        sqlQuery = "SELECT * FROM cats WHERE CatID = #{id};"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end

    # Return a list of cats foster by employee with id employeeId
    def self.fosteredBy(employeeid)
        results = nil
        sqlQuery = "SELECT * FROM Cats WHERE EmployeeID = #{employeeid};"

        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.adoptableCats()
        results = nil
        sqlQuery = "SELECT * FROM cats WHERE cats.CatID NOT IN (SELECT CatID FROM adoptions);"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.adopt(catid, memberid)
        results = nil
        sqlQuery = "INSERT INTO adoptions (CatID, MemberID) VALUE (#{catid}, #{memberid});"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

=begin
    # Find cat with name
    def self.findByName(catname)
        results = nil
        sqlQuery = "SELECT * FROM Members WHERE CatName = \'" + catname + "\';"
        begin
                ActiveRecord::Base.transaction do
                    results = ActiveRecord::Base.connection.exec_query(sqlQuery)
                end
        rescue Exception => exc
            raise exc;
        end
        return results
    end
=end

    def self.create(catname, catphotourl, cattype, employeeid)
        results = nil
        sqlQuery = "INSERT INTO Cats (CatName, CatPhotoUrl, CatType, EmployeeID) VALUE "
        sqlQuery = sqlQuery + "(\'#{catname}\', \'#{catphotourl}\', \'#{cattype}\', #{employeeid});"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.edit(id, catname, catphotourl, cattype, employeeid)
        results = nil
        addComma = false
        sqlQuery = "UPDATE Cats SET "
        if (!catname.nil?)
            sqlQuery = sqlQuery + "CatName = \'" + catname + "\'"
            addComma = true
        end
        if (!catphotourl.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "CatPhotoUrl = \'" + catphotourl + "\'"
            addComma = true
        end
        if (!cattype.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "CatType = \'" + cattype + "\'"
            addComma = true
        end
        if (!employeeid.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "EmployeeID = #{employeeid}"
            addComma = true
        end
        sqlQuery = sqlQuery + " WHERE CatID = #{id};"

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
        sqlQuery = "DELETE FROM Cats WHERE CatID = #{id};"

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
