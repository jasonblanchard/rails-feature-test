class CommentsController < ApplicationController
  before_filter :authenticate, :only => :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    if @comment.save
      respond_to do |format|
        format.html { redirect_to @post}
        format.js
      end
    else
      respond_to do |format|
        format.html { redirect_to @post, :alert => 'Unable to add comment' }
        format.js { render 'fail_create.js.erb'}
      end
    end
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
