module Api
  module V1
    module Auth
      class SessionsController < DeviseTokenAuth::SessionsController
        def get_login_user
          user = User.includes(:posts).find_by(uid: params[:uid])
          puts params[:uid]
          puts params[:uid]
          puts user
        end
      end
    end
  end
end
