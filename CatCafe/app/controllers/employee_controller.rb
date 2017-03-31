class EmployeeController < ApplicationController
	def main
		@isManager = Employee.manager?(params[:id])
	end

	def find_transaction
		@transactionId = params[:transaction][:id]
		begin
			@transaction = Transaction.findById(@transactionId)
			flash[:notice] = @transaction
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def find_by_refId
		@referenceId = params[:transaction][:refId]
		begin
			@transaction = Transaction.findByReferenceId(@referenceId)
			flash[:notice] = @transaction
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def create_transaction
		@referenceId = params[:transaction][:refId]
		@paymentType = params[:pay_type]
		@total = params[:transaction][:total]
		@time = params[:transaction][:time]
		@employeeId = params[:employee][:id]
		begin
			Transaction.create(@referenceId, @paymentType, @total, @time, @employeeId)
			flash[:notice] = "Transaction Created!"
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def edit_transaction
		@transactionId = params[:transaction][:id]
		@referenceId = params[:transaction][:refId]
		@paymentType = params[:pay_type]
		@total = params[:transaction][:total]
		@time = params[:transaction][:time]
		@employeeId = params[:employee][:id]
		begin
			Transaction.edit(@transactionId, @referenceId, @paymentType, @total, @time, @employeeId)
			flash[:notice] = "Transaction Edited!"
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def destroy_transaction
		@transactionId = params[:transaction][:id]
		begin
			Transaction.destroy(@transactionId)
			flash[:notice] = "Transaction Destroyed!"
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def find_item
		@itemId = params[:item][:id]
		@item = Item.findById(@itemId)
		if !@item.nil?
			flash[:notice] = @item
		else
			flash[:warning] = "No item found!"
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def create_item
		@name = params[:item][:name]
		@price = params[:item][:price]
		begin
			Item.create(@name, @price)
			flash[:notice] = "Item Created!"
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def edit_item
		@itemId = params[:item][:id]
		@name = params[:item][:name]
		@price = params[:item][:price]
		begin
			Item.edit(@itemId, @name, @price)
			flash[:notice] = "Item Edited!"
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end

	def destroy_item
		@itemId = params[:item][:id]
		begin
			Item.destroy(@itemId)
			flash[:notice] = "Item Destroyed!"
		rescue Exception => e
			flash[:warning] = e.message
		end
		redirect_to controller: "employee", action: "main", id: params[:id]
	end
end
