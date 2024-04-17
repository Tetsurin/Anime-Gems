require "test_helper"

class AnimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @anime = animes(:one)
  end

  test "should get index" do
    get animes_url
    assert_response :success
  end

  test "should get new" do
    get new_anime_url
    assert_response :success
  end

  test "should create anime" do
    assert_difference("Anime.count") do
      post animes_url, params: { anime: { description: @anime.description, director: @anime.director, total_episodes: @anime.total_episodes, horizontal_poster: @anime.horizontal_poster, logo: @anime.logo, name: @anime.name, original_name: @anime.original_name, poster: @anime.poster, release_date: @anime.release_date, studio: @anime.studio, type: @anime.type } }
    end

    assert_redirected_to anime_url(Anime.last)
  end

  test "should show anime" do
    get anime_url(@anime)
    assert_response :success
  end

  test "should get edit" do
    get edit_anime_url(@anime)
    assert_response :success
  end

  test "should update anime" do
    patch anime_url(@anime), params: { anime: { description: @anime.description, director: @anime.director, total_episodes: @anime.total_episodes, horizontal_poster: @anime.horizontal_poster, logo: @anime.logo, name: @anime.name, original_name: @anime.original_name, poster: @anime.poster, release_date: @anime.release_date, studio: @anime.studio, type: @anime.type } }
    assert_redirected_to anime_url(@anime)
  end

  test "should destroy anime" do
    assert_difference("Anime.count", -1) do
      delete anime_url(@anime)
    end

    assert_redirected_to animes_url
  end
end
