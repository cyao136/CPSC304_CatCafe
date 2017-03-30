class LoginController < ApplicationController
  def login
  	# if successful render the screen for member
  	id = 0
  	redirect_to controller: 'member', action: 'main', id: id
  end
  def sign_up
  	@firstName = params[:user][:firstname]
  	@lastName = params[:user][:lastname]
  	@telephone = params[:user][:telephone]
  	@email = params[:email]
  	@password = [:user][:password]

  	Member.create(@firstName, @lastName, @telephone, @email, @password);
  end
end
