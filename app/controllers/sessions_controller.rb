class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by_email(user_params[:email])
        puts "helloooooo #{@user.inspect}"
        #if user exists and the password is correct.

        if @user && @user.authenticate(user_params[:password])
            #save uder id inside browser cookie.
            session[:user_id] = @user.id
            redirect_to root_path
        else
            flash.now.alert = "Incorrect email or password, try again."
            redirect_to "/login"
        end
    end

    def destroy
        session[:user_id] = nil 
        redirect_to '/login'
    end
    
    private
    def user_params
        params.require(:user).permit(
            :email,
            :password
        )
    end
end
