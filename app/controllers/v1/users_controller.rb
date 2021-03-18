module V1
  class UsersController < ApplicationController
    def create
      @user = User.new(user_params)
      # debugger
      if @user.save
        # UserMailer.with(@user).welcome_email.deliver_later
        render :create
      else
        head(:unprocessble_entity)
      end
    end

    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
  end
end
