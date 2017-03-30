class BookingController < ApplicationController
	def main
	end

	def find_booking
		@bookingID = params[:booking][:bookingID]
		result = Booking.find(@bookingID)
		@booking = result.first
	end

	# def create_booking
	# 	@memberId = params[:id]
	# 	@date = params[:booking][:day]
	# 	@time = params[:start][:end]
	# 	@telephone = params[:member][:phone]
	# 	@roomId = params[:room_id]
	# 	#TODO: fill in params
	# 	Booking.create()
	# end

	def edit_booking
		@bookingID = params[:bookingID]
		@date = params[:booking][:day]
		@time = params[:start][:end]
		@roomId = params[:room_id]
		#TODO: fill in params
		Booking.edit()
	end

end
