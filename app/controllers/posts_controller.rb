class PostsController < ApplicationController
  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)
    respond_with post
  end

  def create
    respond_with Post.create(post_params)
  end

  def index
    # respond_with Post.all
    posts = Post.all
    render json: posts, status: 200
  end

  def show
    # respond_with Post.find(params[:id])
    post = Post.find(params[:id])
    render json: post, status: :ok
  end

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
