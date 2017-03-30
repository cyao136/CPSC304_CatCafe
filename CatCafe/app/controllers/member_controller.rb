class MemberController < ApplicationController
	def main
	end

	def adopt
		@available_cats = [["Meow", 1],["Roar", 2]]
	end

	def adopt_submit
		#TODO Submit the adoption with params
		@memberId = params[:id]
		@age = params[:member][:age]
		@phone = params[:member][:phone]
		@catId = params[:cat_id]
	end

	def book
		@available_rooms = [101, 101, 102, 103, 104]
	end

	def book_submit
		#TODO: submit params
		@memberId = params[:id]
		@bookingTime = params[:day][:start][:end]
		@member = params[:member]
		@roomId = params[:room_id]

		Booking.create()
	end

	def rooms_booked_by
		# which id? o_o
		@memberId = params[:id]
		@result = Booking.bookedBy(@memberId)
	end

	def find_member_id
		@id = params[:id]
		result = Member.findById(@id)
		@member = result.first
		#TODO: not sure about the id param
		# return member
	end

	def find_member_email
		@email = params[:email]
		result = Member.findByEmail(@email)
		@member = result.first
	end

	def edit_member
		@id = params[:id]
		@mname = params[:user][:firstname][:lastname]
		@telephone = params[:user][:telephone]
		@email = params[:email]
		@mpassword = params[:user][:password]
		Member.edit(@memberId, @name, @telephone, @email, @password)
	end

	def destroy
		@id = params[:id]
		Member.edit(@id)
	end
end
