class RevisionsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @revisions = @post.revisions.all(:order => "created_at DESC")
  end

  def show
    @post = Post.find(params[:post_id])
    @revision = Revision.find(params[:id])
    @diff = show_diff(@revision.content, @post.content)
  end
end

def show_diff(string1, string2)
  Diffy::Diff.new(string1, string2, :include_plus_and_minus_in_html => true)
end
