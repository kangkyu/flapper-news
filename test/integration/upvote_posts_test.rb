require 'test_helper'

class UpvotePostsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'example.com'
  end

  test 'successful vote' do
    post = posts(:one)
    put "/posts/#{post.id}/upvote", {post: post.attributes}.to_json, { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 200, response.status
    assert_equal post.upvotes + 1, post.reload.upvotes
  end

end
