class EmployeeController < ApplicationController
	def main
	end

	def find_employee
		@employeeId = params[:employee][:id]
		result = Employee.findById(@employeeId)
		@employee = result.first
	end

	def create_employee
		@ename = params[:employee][:name]
		@password = password[:employee][:password]
		Employee.create(@ename, @password)
	end

	def edit_employee
		@employeeId = params[:employee][:id]
		@ename = params[:employee][:name]
		@password = password[:employee][:password]
		Employee.edit(@employeeId, @ename, @password)
	end

	def destroy_employee
		@employeeId = params[:employee][:id]
		Employee.destroy(@employeeId)
	end	

	def isManager
		@employeeId = params[:employee][:id]
		isManager = Employee.manager?(@employeeId)
	end

	def find_transaction
		@transactionId = params[:transaction][:id]
		result = Transaction.findById(@transactionId)
		@transaction = result.first
	end

	def find_by_refId
		@referenceId = params[:transaction][:refId]
		result = Employee.findByReferenceId
		@transaction = result.first
	end

	def create_transaction
		@referenceId = params[:transaction][:refId]
		@paymentType = params[:pay_type]
		@total = params[:transaction][:total]
		@time = params[:transaction][:time]
		@employeeId = params[:employee][:id]
		Transaction.create(@referenceId, @paymentType, @total, @time, @employeeId)
	end

	def edit_transaction
		@transactionId = params[:transaction][:id]
		@referenceId = params[:transaction][:refId]
		@paymentType = params[:pay_type]
		@total = params[:transaction][:total]
		@time = params[:transaction][:time]
		@employeeId = params[:employee][:id]
		Transaction.edit(@transactionId, @referenceId, @paymentType, @total, @time, @employeeId)
	end

	def destroy_transaction
		@transactionId = [:transaction][:id]
		Transaction.destroy(@transactionId)
	end

	def find_item
		@itemId = params[:item][:id]
		result = Item.findById(@itemId)
		@item = @itemId
	end

	def create_item
		@name = params[:item][:name]
		@price = params[:item][:price]
		Item.create(@name, @price)
	end

	def edit_item
		@itemId = params[:item][:id]
		@name = params[:item][:name]
		@price = params[:item][:price]
		Item.edit(@itemId, @name, @price)
	end

	def destroy_item
		@itemId = params[:item][:id]
		Item.destroy(@itemId)
	end
end
