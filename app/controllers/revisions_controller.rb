class RevisionsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @revisions = @post.revisions.all(:order => "created_at DESC")
  end

  def show
    @post = Post.find(params[:post_id])
    @revision = Revision.find(params[:id])
  end
end
