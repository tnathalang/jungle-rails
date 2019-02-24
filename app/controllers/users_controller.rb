class UsersController < ApplicationController

    def new
        #render new form
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            redirect_to root_path, notice: "User Created"
        else
            render :new, notice: user.errors.full_messages
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
