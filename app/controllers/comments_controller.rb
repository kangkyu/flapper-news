class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :upvote]

  def upvote
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.increment!(:upvotes)

    respond_with post, comment
  end

  def create
    post = Post.find(params[:post_id])
    comment = post.comments.create(comment_params.merge(user_id: current_user.id))
    respond_with post, comment
  end

  def show
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    respond_with post, comment
  end

  def comment_params
    params.require(:comment).permit(:body, :author)
  end
end
