require 'test_helper'

class InstagramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @instagram = instagrams(:one)
  end

  test "should get index" do
    get instagrams_url
    assert_response :success
  end

  test "should get new" do
    get new_instagram_url
    assert_response :success
  end

  test "should create instagram" do
    assert_difference('Instagram.count') do
      post instagrams_url, params: { instagram: { content: @instagram.content, image: @instagram.image } }
    end

    assert_redirected_to instagram_url(Instagram.last)
  end

  test "should show instagram" do
    get instagram_url(@instagram)
    assert_response :success
  end

  test "should get edit" do
    get edit_instagram_url(@instagram)
    assert_response :success
  end

  test "should update instagram" do
    patch instagram_url(@instagram), params: { instagram: { content: @instagram.content, image: @instagram.image } }
    assert_redirected_to instagram_url(@instagram)
  end

  test "should destroy instagram" do
    assert_difference('Instagram.count', -1) do
      delete instagram_url(@instagram)
    end

    assert_redirected_to instagrams_url
  end
end
