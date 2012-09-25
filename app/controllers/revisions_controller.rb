class RevisionsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @revisions = @post.revisions.all
  end

  def show
    @post = Post.find(params[:post_id])
    @revision = Revision.find(params[:id])
  end
end
