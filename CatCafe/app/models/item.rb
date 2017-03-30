class Item < ApplicationRecord\

	# Find item with id = id
    def self.findById(id)
        results = nil
        sqlQuery = "SELECT * FROM items WHERE ItemID = #{id};"
        begin
            ActiveRecord::Base.transaction do
				results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
        rescue Exception => exc
            return exc;
        end
        return results
    end

    # Find item with name (?)
    def self.findByEmail(name)
        results = nil
        sqlQuery = "SELECT * FROM Items WHERE Name = \'" + name + "\';"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
        rescue Exception => exc
            return exc;
        end
        return results.first
    end

    #TODO create and edit should have their respective params
    def self.create(name, price)
        results = nil
        sqlQuery = "INSERT INTO Items (Name, Price) VALUE "
        sqlQuery = sqlQuery + "(\'" + name + "\', \'" + price + "\');"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
        rescue Exception => exc
            return exc;
        end
        return results
    end

    def self.edit(id, name, price)
        results = nil
        addComma = false
        sqlQuery = "UPDATE Items SET "
        if (!name.nil?)
            sqlQuery = sqlQuery + "Name = \'" + name + "\'"
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
                results = ActiveRecord::Base.connection.execute(sqlQuery)
            end
        rescue Exception => exc
            return exc;
        end
        return results
    end

    def self.destroy(id)
        results = nil
        sqlQuery = "DELETE FROM Items WHERE ItemID = #{id};"

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
