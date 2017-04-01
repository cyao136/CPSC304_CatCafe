class LoginController < ApplicationController

  def login
  end

  def sign_up
  end

  def login_submit
  	# if successful render the screen for member
    @email = params[:user][:email]
    @password = params[:user][:password]
    @member = Member.login(@email, @password)
    if !@member.nil?
      redirect_to controller: 'member', action: 'main', id: @member["MemberID"]
    else
      flash[:errors] = "Wrong user/pass"
      redirect_to controller: 'login', action: 'login'
    end
  end

  def sign_up_submit
  	@firstName = params[:user][:firstname]
  	@lastName = params[:user][:lastname]
  	@telephone = params[:user][:telephone]
  	@email = params[:user][:email]
  	@password = params[:user][:password]

    begin
      Member.create("#{@firstName} #{@lastName}", @telephone, @email, @password);
      @member = Member.login(@email, @password)
      redirect_to controller: 'member', action: 'main', id: @member["MemberID"]
    rescue Exception => e
      flash[:errors] = e.message
      redirect_to controller: 'login', action: 'sign_up'
    end

  end

  def employee_login_submit
    @employeeid = params[:employee][:id]
    @employeepassword = params[:employee][:password]
    @employee = Employee.login(@employeeid, @employeepassword)
    if !@employee.nil?
      redirect_to controller: 'employee', action: 'main', id: @employee["EmployeeID"]
    else
      flash[:errors] = "Wrong user/pass"
      redirect_to controller: 'login', action: 'login'
    end
  end
end
