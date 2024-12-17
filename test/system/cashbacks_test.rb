require "application_system_test_case"

class CashbacksTest < ApplicationSystemTestCase
  setup do
    @cashback = cashbacks(:one)
  end

  test "visiting the index" do
    visit cashbacks_url
    assert_selector "h1", text: "Cashbacks"
  end

  test "should create cashback" do
    visit cashbacks_url
    click_on "New cashback"

    click_on "Create Cashback"

    assert_text "Cashback was successfully created"
    click_on "Back"
  end

  test "should update Cashback" do
    visit cashback_url(@cashback)
    click_on "Edit this cashback", match: :first

    click_on "Update Cashback"

    assert_text "Cashback was successfully updated"
    click_on "Back"
  end

  test "should destroy Cashback" do
    visit cashback_url(@cashback)
    click_on "Destroy this cashback", match: :first

    assert_text "Cashback was successfully destroyed"
  end
end
