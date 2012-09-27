class CommentsController < ApplicationController
  before_filter :authenticate, :only => :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path(@post)
  end

  def new
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end
end
