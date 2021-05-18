require "test_helper"

class FilmViewingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @film_viewing = film_viewings(:one)
  end

  test "should get index" do
    get film_viewings_url
    assert_response :success
  end

  test "should get new" do
    get new_film_viewing_url
    assert_response :success
  end

  test "should create film_viewing" do
    assert_difference('FilmViewing.count') do
      post film_viewings_url, params: { film_viewing: { name: @film_viewing.name, rating: @film_viewing.rating, user_id: @film_viewing.user_id } }
    end

    assert_redirected_to film_viewing_url(FilmViewing.last)
  end

  test "should show film_viewing" do
    get film_viewing_url(@film_viewing)
    assert_response :success
  end

  test "should get edit" do
    get edit_film_viewing_url(@film_viewing)
    assert_response :success
  end

  test "should update film_viewing" do
    patch film_viewing_url(@film_viewing), params: { film_viewing: { name: @film_viewing.name, rating: @film_viewing.rating, user_id: @film_viewing.user_id } }
    assert_redirected_to film_viewing_url(@film_viewing)
  end

  test "should destroy film_viewing" do
    assert_difference('FilmViewing.count', -1) do
      delete film_viewing_url(@film_viewing)
    end

    assert_redirected_to film_viewings_url
  end
end
