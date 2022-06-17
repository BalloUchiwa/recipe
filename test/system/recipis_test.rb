require "application_system_test_case"

class RecipisTest < ApplicationSystemTestCase
  setup do
    @recipi = recipis(:one)
  end

  test "visiting the index" do
    visit recipis_url
    assert_selector "h1", text: "Recipis"
  end

  test "should create recipi" do
    visit recipis_url
    click_on "New recipi"

    fill_in "Author", with: @recipi.author
    fill_in "Category", with: @recipi.category
    fill_in "Cook time", with: @recipi.cook_time
    fill_in "Cuisine", with: @recipi.cuisine
    fill_in "Image", with: @recipi.image
    fill_in "Ingredients", with: @recipi.ingredients
    fill_in "Prep time", with: @recipi.prep_time
    fill_in "Ratings", with: @recipi.ratings
    fill_in "Title", with: @recipi.title
    click_on "Create Recipi"

    assert_text "Recipi was successfully created"
    click_on "Back"
  end

  test "should update Recipi" do
    visit recipi_url(@recipi)
    click_on "Edit this recipi", match: :first

    fill_in "Author", with: @recipi.author
    fill_in "Category", with: @recipi.category
    fill_in "Cook time", with: @recipi.cook_time
    fill_in "Cuisine", with: @recipi.cuisine
    fill_in "Image", with: @recipi.image
    fill_in "Ingredients", with: @recipi.ingredients
    fill_in "Prep time", with: @recipi.prep_time
    fill_in "Ratings", with: @recipi.ratings
    fill_in "Title", with: @recipi.title
    click_on "Update Recipi"

    assert_text "Recipi was successfully updated"
    click_on "Back"
  end

  test "should destroy Recipi" do
    visit recipi_url(@recipi)
    click_on "Destroy this recipi", match: :first

    assert_text "Recipi was successfully destroyed"
  end
end
