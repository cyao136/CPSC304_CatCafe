require 'test_helper'

class SignUpControllerTest < ActionDispatch::IntegrationTest
  test "should get createAccount" do
    get sign_up_createAccount_url
    assert_response :success
  end

end
