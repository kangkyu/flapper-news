class PostsController < ApplicationController
  def upvote
  end

  def create
    respond_with Post.create(post_params)
  end

  def index
    respond_with Post.all
  end

  def show
    respond_with Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
