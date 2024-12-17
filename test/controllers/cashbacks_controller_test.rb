require "test_helper"

class CashbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cashback = cashbacks(:one)
  end

  test "should get index" do
    get cashbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_cashback_url
    assert_response :success
  end

  test "should create cashback" do
    assert_difference("Cashback.count") do
      post cashbacks_url, params: { cashback: {  } }
    end

    assert_redirected_to cashback_url(Cashback.last)
  end

  test "should show cashback" do
    get cashback_url(@cashback)
    assert_response :success
  end

  test "should get edit" do
    get edit_cashback_url(@cashback)
    assert_response :success
  end

  test "should update cashback" do
    patch cashback_url(@cashback), params: { cashback: {  } }
    assert_redirected_to cashback_url(@cashback)
  end

  test "should destroy cashback" do
    assert_difference("Cashback.count", -1) do
      delete cashback_url(@cashback)
    end

    assert_redirected_to cashbacks_url
  end
end
