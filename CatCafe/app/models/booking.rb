class Booking < ApplicationRecord

    def self.bookedTimesForRoomByDate(roomid, date)
        results = nil
        sqlQuery = "SELECT * FROM bookings WHERE bookings.RoomID = #{roomid} AND bookings.Date = \'#{date}\';"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

	# Find booking with id = id
	def self.findById(id)
		results = nil
        sqlQuery = "SELECT * FROM bookings WHERE BookingID = #{id};"
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
    # Find booking with date and fromTime (if there is only 1 room)
    def self.findByDateAndTime(date, fromtime)
        results = nil
        sqlQuery = "SELECT * FROM bookings WHERE Date = \ '" + date + "\'AND  FromTime = \ '" + fromtime + "\';"
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

    # return bookings booked by member with Id memberId
    def self.bookedBy(memberid)
        results = nil
        sqlQuery = "SELECT * FROM bookings WHERE MemberId = #{memberid};"

        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

	# create and edit
	def self.create(date, fromtime, totime, memberid, roomid)
        results = nil
        sqlQuery = "INSERT INTO bookings (Date, FromTime, ToTime, MemberID, RoomID) VALUE"
        sqlQuery = sqlQuery + "(\'#{date}\', \'#{fromtime}\', \'#{totime}\', \'#{memberid}\',\'#{roomid}\');"
        begin
            ActiveRecord::Base.transaction do
                results = ActiveRecord::Base.connection.exec_query(sqlQuery)
            end
        rescue Exception => exc
            raise exc;
        end
        return results
    end

    def self.edit(id, date, fromtime, totime, memberid, roomid)
        results = nil
        addComma = false
        sqlQuery = " UPDATE Bookings SET "
        if(!date.nil?)
            sqlQuery = sqlQuery + "Date = \'" + date + "\'"
            addComma = true
        end
        if (!fromtime.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "FromTime = \'" + fromtime + "\'"
            addComma = true
        end
        if (!memberid.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + "MemberID = #{memberid}"
            addComma = true
        end
        if (!roomid.nil?)
            if (addComma)
                sqlQuery = sqlQuery + ", "
            end
            sqlQuery = sqlQuery + " RoomID = #{roomid}"
            addComma = true
        end
        sqlQuery = sqlQuery + " WHERE BookingID = #{id};"
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
        sqlQuery = " DELETE FROM Bookings WHERE BookingID = #{id};"

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
