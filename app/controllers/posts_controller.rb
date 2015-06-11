class PostsController < ApplicationController
  def upvote
  end

  def create
  end

  def index
  end

  def show
  end

  def post_params
    params.require(:post).permit(:title, :link)
  end
end
