class CommentsController < ApplicationController
  def upvote
  end

  def create
  end

  def show
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
