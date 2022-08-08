require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get buy" do
    get transactions_buy_url
    assert_response :success
  end

  test "should get sell" do
    get transactions_sell_url
    assert_response :success
  end
end
