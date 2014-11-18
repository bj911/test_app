class PostsController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.group_by(&:message_type)
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js {render :json => {:message => (@post.message+ " "+@post.created_at.to_s)} if @post.message_type == "ajax"}
      end
    else
      #errors
    end
  end

  private

  def post_params
    params.require(:post).permit(:message, :message_type)
  end
end
