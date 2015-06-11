class CommentsController < ApplicationController
  def upvote
    post = Post.find(params[:post_id])
    comment = post.comments.find(params[:id])
    comment.increment!(:upvotes)

    respond_with post, comment
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
