class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        #if user exists and the password is correct.
        if @user =  User.authenticate_with_credentials(user_params[:email].downcase.strip , user_params[:password])
            #save user id inside browser cookie.
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @user = User.new(user_params)
            @user.errors.add(:credentials, "Invalid email or password")
            render :new 
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
