require "application_system_test_case"

class FilmViewingsTest < ApplicationSystemTestCase
  setup do
    @film_viewing = film_viewings(:one)
  end

  test "visiting the index" do
    visit film_viewings_url
    assert_selector "h1", text: "Film Viewings"
  end

  test "creating a Film viewing" do
    visit film_viewings_url
    click_on "New Film Viewing"

    fill_in "Name", with: @film_viewing.name
    fill_in "Rating", with: @film_viewing.rating
    fill_in "User", with: @film_viewing.user_id
    click_on "Create Film viewing"

    assert_text "Film viewing was successfully created"
    click_on "Back"
  end

  test "updating a Film viewing" do
    visit film_viewings_url
    click_on "Edit", match: :first

    fill_in "Name", with: @film_viewing.name
    fill_in "Rating", with: @film_viewing.rating
    fill_in "User", with: @film_viewing.user_id
    click_on "Update Film viewing"

    assert_text "Film viewing was successfully updated"
    click_on "Back"
  end

  test "destroying a Film viewing" do
    visit film_viewings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Film viewing was successfully destroyed"
  end
end
