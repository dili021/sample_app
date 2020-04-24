require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get sign_up_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name:                     "",
                                         email:        "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  test "valid signup information" do
    get sign_up_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:               "Irfan Tormashi",
                                         email:       "Ifran@Tormashovic.com",
                                         password:              "UrfanZaInje",
                                         password_confirmation: "UrfanZaInje" } }
    end
    follow_redirect!
    assert_template 'users/show'
    # assert_select 'div#error_explanation'
    # assert_select 'div.field_with_errors'
  end
  
end
