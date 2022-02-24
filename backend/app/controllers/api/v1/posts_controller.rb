class Api::V1::PostsController < ApplicationController
  before_action :set_user, only: :create

  # 自動更新機能(5秒毎に呼び出す)
  def index
    user = User.find_by(id: params[:user_id])
    uniq_usr_last_post_id = params[:id].to_i
    posts = user.posts.includes(:user).where("id > #{uniq_usr_last_post_id}")
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

private
  def set_user
    @user = User.find(post_params[:user_id])
  end

  def post_params
    params.require(:post).permit(:user_id, :content)
  end
end
