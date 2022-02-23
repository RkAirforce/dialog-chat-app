module Api
  module V1
    module Auth
      class RegistrationsController < DeviseTokenAuth::RegistrationsController
      private

        def sign_up_params
          params.permit(:name, :email, :description, :password, :password_confirmation, :image)
        end
      
        def account_update_params
          params.permit(:name, :email, :image, :profile, :description)
        end
      end
    end
  end
end

