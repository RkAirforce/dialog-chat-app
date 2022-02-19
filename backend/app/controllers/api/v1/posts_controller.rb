class Api::V1::PostsController < ApplicationController
  def index
  end

  def show
    
  end

  def create
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
  params.require(:post).permit(:content)
end
