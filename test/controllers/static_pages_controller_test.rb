require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get investment" do
    get static_pages_investment_url
    assert_response :success
  end

  test "should get studio" do
    get static_pages_studio_url
    assert_response :success
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
  end

  test "should get clients" do
    get static_pages_clients_url
    assert_response :success
  end

end
