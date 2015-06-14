require 'test_helper'

class CreatingPostsTest < ActionDispatch::IntegrationTest

  setup do
    host! 'example.com'
  end

  test 'creates posts' do
    post = posts(:one)
    post '/posts', {post: post.attributes}.to_json, { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    post_response = json(response.body)
    assert_equal post_url(post_response[:id]), response.location
  end

  test 'does not create posts with title nil' do
    post '/posts', {post: {title: nil, link: "http://news.link"}}.to_json, { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
