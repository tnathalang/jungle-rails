class UsersController < ApplicationController

    def new
        #render new form
        @user = User.new
    end

    def create
        puts "SOMERANDOM TEXT"
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to root_path
        else
            render :new
        end
    end


    private
        def user_params
            params.require(:user).permit(
            :name,
            :email,
            :password,
            :password_confirmation
            )
        end
end
