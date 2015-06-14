require 'test_helper'

class ListingPostsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'example.com'
  end

  test "returns list of all posts" do
    get '/posts'
    assert_equal 200, response.status
    # assert response.success?
    refute_empty response.body
  end

  test "returns posts in JSON" do
    get '/posts', {}, { 'Accept' => Mime::JSON }
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end

  test "returns posts with title" do
    get '/posts'
    assert response.success?

    posts_response = json(response.body)
    titles = posts_response.map {|p| p[:title]}
    assert_includes titles, posts(:one).title
  end

  test "returns post by id" do
    post = posts(:one)
    get "/posts/#{post.id}"
    assert response.success?

    post_response = json(response.body)
    assert_equal post.title, post_response[:title]
  end

end
