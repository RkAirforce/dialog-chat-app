class Api::V1::PostsController < ApplicationController
  before_action :set_user, only: :create

  def index
    render json: user_signed_in?
  end

  def show

  end

  def create
    post = Post.new(post_params)
    post.user = @user
    if post.save
      render json: post
    end
  end

  def update
  end

  def destroy
  end

  def auto_loading
    user = User.find(params[:id])
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
