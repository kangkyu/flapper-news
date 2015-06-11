class CommentsController < ApplicationController
  def upvote
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params)
    respond_with post, comment
  end

  def show
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    respond_with post, comment
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
