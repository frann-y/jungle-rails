class UsersController < ApplicationController

    def new
        #render the new form
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
          session[:user_id] = user.id
          redirect_to '/' #redirect_to root_path
        else
          redirect_to '/register'
        end

        #SendEmailJob.set(wait: 20.seconds).perform_later(@user)
        
    end 

    private

    def user_params
        params.require(:user).permit(
            :first_name,
            :last_name,
            :email,
            :password,
            :password_confirmation,
        )
    end
    
end