class Item < ApplicationRecord\

	# Find item with id = id
    def self.findById(id)
        results = nil
        sqlQuery = "SELECT * FROM Items WHERE ItemID = #{id};"
        begin
            ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end

=begin
    # Find item with name (?)
    def self.findByName(iname)
        results = nil
        sqlQuery = "SELECT * FROM Items WHERE Name = \'" + iname + "\';"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end
=end

    def self.create(iname, price)
        results = nil
        sqlQuery = "INSERT INTO Items (Name, Price) VALUE "
        sqlQuery = sqlQuery + "(\'#{iname}\', \'#{price}\');"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.edit(id, iname, price)
        results = nil
        addComma = false
        sqlQuery = "UPDATE Items SET "
        if (!iname.nil?)
            sqlQuery = sqlQuery + "Name = \'" + iname + "\'"
            addComma = true
        end
        if (!price.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "Price = \'" + price + "\'"
            addComma = true
        end
        sqlQuery = sqlQuery + " WHERE ItemID = #{id};"

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
        sqlQuery = "DELETE FROM Items WHERE ItemID = #{id};"

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
