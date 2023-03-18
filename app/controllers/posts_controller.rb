class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @posts = Post.where(author_id: params[:user_id]) || 'No posts yet'
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || 'No posts yet'
    @comments = @post.comments
  end
end
