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
end
