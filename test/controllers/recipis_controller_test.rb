require "test_helper"

class RecipisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipi = recipis(:one)
  end

  test "should get index" do
    get recipis_url
    assert_response :success
  end

  test "should get new" do
    get new_recipi_url
    assert_response :success
  end

  test "should create recipi" do
    assert_difference("Recipi.count") do
      post recipis_url, params: { recipi: { author: @recipi.author, category: @recipi.category, cook_time: @recipi.cook_time, cuisine: @recipi.cuisine, image: @recipi.image, ingredients: @recipi.ingredients, prep_time: @recipi.prep_time, ratings: @recipi.ratings, title: @recipi.title } }
    end

    assert_redirected_to recipi_url(Recipi.last)
  end

  test "should show recipi" do
    get recipi_url(@recipi)
    assert_response :success
  end

  test "should get edit" do
    get edit_recipi_url(@recipi)
    assert_response :success
  end

  test "should update recipi" do
    patch recipi_url(@recipi), params: { recipi: { author: @recipi.author, category: @recipi.category, cook_time: @recipi.cook_time, cuisine: @recipi.cuisine, image: @recipi.image, ingredients: @recipi.ingredients, prep_time: @recipi.prep_time, ratings: @recipi.ratings, title: @recipi.title } }
    assert_redirected_to recipi_url(@recipi)
  end

  test "should destroy recipi" do
    assert_difference("Recipi.count", -1) do
      delete recipi_url(@recipi)
    end

    assert_redirected_to recipis_url
  end
end
