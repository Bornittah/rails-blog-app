class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id].to_i)
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find_by(author_id: params[:user_id], id: params[:id]) || 'No posts yet'
    @comments = @post.comments
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def post_params
    params
      .require(:post)
      .permit(:title, :text)
      .merge(author: current_user, comments_counter: 0, likes_counter: 0)
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_post_path(current_user, @post)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          redirect_to new_user_post_path(current_user)
        end
      end
    end
  end

  private :post_params
end
