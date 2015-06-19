require 'test_helper'

class UpvotePostsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'example.com'
  end

  test 'successful vote' do
    post_via_redirect '/users/sign_in', user: {email: users(:one).email, password: "password"}, format: :json

  # sign_in users(:one)
  # These helpers are not going to work for integration tests driven
  # by Capybara or Webrat. They are meant to be used with functional tests only.
  # Instead, fill in the form or explicitly set the user in session;
  # https://github.com/plataformatec/devise#test-helpers

    post = posts(:one)
    put "/posts/#{post.id}/upvote", {post: post.attributes}.to_json, { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 200, response.status
    assert_equal post.upvotes + 1, post.reload.upvotes
  end

end
