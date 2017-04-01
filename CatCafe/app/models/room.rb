class Room < ApplicationRecord

	# Find room with id = id
    def self.findById(id)
        results = nil
        sqlQuery = "SELECT * FROM rooms WHERE RoomID = #{id};"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results.first
    end

    def self.availableRooms()
        results = nil
        sqlQuery = "SELECT * FROM rooms;"
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
    # Find room with status
    def self.findByStatus(status)
        results = nil
        sqlQuery = "SELECT * FROM Rooms WHERE Status = \'" + status + "\';"
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

    def self.create(status)
        results = nil
        sqlQuery = "INSERT INTO Rooms (status) VALUE "
        sqlQuery = sqlQuery + "(#{status});"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.edit(id, status)
        results = nil
        addComma = false
        sqlQuery = "UPDATE Rooms SET "
        if (!status.nil?)
            sqlQuery = sqlQuery + "Status = " + (status ? "TRUE" : "FALSE")
            addComma = true
        end
        sqlQuery = sqlQuery + " WHERE RoomID = #{id};"

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
        sqlQuery = "DELETE FROM Rooms WHERE RoomID = #{id};"

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
