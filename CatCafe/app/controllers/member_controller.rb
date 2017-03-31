class MemberController < ApplicationController
	def main
	end

	def adopt
		result = Cat.adoptableCats();
		@available_cats = Array.new;
		if !result.nil?
			result.each do |cat|
				newCat = [cat["CatName"], cat["CatID"]]
				@available_cats << newCat
			end
		end
	end

	def adopt_submit
		@memberId = params[:id]
		@catId = params[:cat_id]
		Cat.adopt(@catId, @memberId)
	end

	def book
		result = Room.availableRooms();
		@available_rooms = Array.new;
		if !result.nil?
			result.each do |room|
				newRoom = room["RoomID"]
				@available_rooms << newRoom
			end
		end
	end

	def book_submit
		@bookingDay = params[:booking][:day]
		@bookingStart = params[:booking][:start]
		@bookingEnd = params[:booking][:end]
		@memberId = params[:id]
		@roomId = params[:room_id]

		bookedTimes = Booking.bookedTimesForRoomByDate(@roomId, @bookingDay)

		if !bookedTimes.nil?
			bookedTimes.each do |book|
				if book["FromTime"] == @bookingStart
      				flash[:errors] = "Room not free during that time!"
					redirect_to controller: "member", action: "book", id: @memberId
				end
			end
		end
		Booking.create(@bookingDay, @bookingStart, @bookingEnd, @memberId, @roomId)
	end

	def rooms_booked_by
		@memberId = params[:member][:id]
		@result = Booking.bookedBy(@memberId)
	end

	def find_member_id
		@id = params[:id]
		result = Member.findById(@id)
		@member = result.first
		# return member
	end

	def find_member_email
		@email = params[:member][:email]
		result = Member.findByEmail(@email)
		@member = result.first
	end

	def edit_member
		@id = params[:id]
		@fname = params[:user][:firstname]
		@lname = params[:user][:lastname]
		@telephone = params[:user][:telephone]
		@email = params[:email]
		@mpassword = params[:user][:password]
		Member.edit(@memberId, "#{@fname} #{@lname}", @telephone, @email, @password)
	end

	def destroy
		@id = params[:member][:id]
		Member.destroy(@id)
	end
end
