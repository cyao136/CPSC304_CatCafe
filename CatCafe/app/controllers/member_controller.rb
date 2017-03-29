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
	end
	
end
