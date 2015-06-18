class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote]

  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)
    # respond_with post
    render json: post, status: 200
  end

  def create
    # respond_with Post.create(post_params)
    post = Post.new(post_params)
    if post.save
      render json: post, status: 201, location: post
    else
      render json: post.errors, status: 422
    end
  end

  def index
    # respond_with Post.all
    posts = Post.all
    render json: posts, status: 200
  end

  def show
    # respond_with Post.find(params[:id])
    post = Post.find(params[:id])
    render json: post, status: 200
  end

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
