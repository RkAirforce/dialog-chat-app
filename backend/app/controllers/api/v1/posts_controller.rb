class Api::V1::PostsController < ApplicationController
  before_action :set_user, only: :create

  def index
    posts = Post.includes(:user).all
    render json: posts.as_json(include: {user: {only: %w[image name]}})
  end

  def create
    post = Post.new(post_params)
    post.user = @user
    if post.save
      render json: post.as_json(include: :user)
    end
  end

  def update
  end

  def destroy
  end

  def auto_loading
    last_message_id = params[:id].to_i
    @messages = group.messages.includes(:user).where("id > #{last_message_id}")
  end

private
  def set_user
    @user = User.find(post_params[:user_id])
  end

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
