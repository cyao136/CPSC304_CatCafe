class EmployeeController < ApplicationController
	def main
	end

	def find_employee
		@employeeId = params[:employee][:id]
		result = Employee.findById(@employeeId)
		@employee = result
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

	def isManager
		@employeeId = params[:employee][:id]
		isManager = Employee.manager?(@employeeId)
	end

	def find_transaction
		@transactionId = params[:transaction][:id]
		result = Transaction.findById(@transactionId)
	end

	def create_transaction
		@referenceId = params[:transaction][:refId]
		@paymentType = params[:pay_type]
		@trxnTotal = params[:transaction][:total]
		@trxnDate = params[:transaction][:day]
		@employeeId = params[:employee][:id]
		#TODO: insert params
		Transaction.create()
	end

	def edit_transaction
		@trxnId =params[:transaction][:id]
		@referenceId = params[:transaction][:refId]
		@paymentType = params[:pay_type]
		@trxnTotal = params[:transaction][:total]
		@trxnDate = params[:transaction][:day]
		@employeeId = params[:employee][:id]
		#TODO: insert params
		Transaction.edit()
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
		Item.edit(@itemId)
	end
end
