class Api::V1::LoggedInController < ApplicationController
  def show
    user = User.find_by(uid: params[:uid])
    render json: user
  end
end
