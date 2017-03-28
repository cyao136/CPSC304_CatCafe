class LoginController < ApplicationController
  def login
  	# if successful render the screen for member
  	id = 0
  	redirect_to controller: 'member', action: 'main', id: id
  end
  def sign_up
  end
end
