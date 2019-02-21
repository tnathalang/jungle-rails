class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by_email(params[:email])
        #if user exists and the password is correct.
        if user && user.authenticate(params[:password])
            #save uder id inside browser cookie.
            session[:user_id] = user.user_id
            redirect_to '/'
        else
            redirect_to '/login'
        end
    end

    def destroy
        session[:user_id] = nil 
        redirect_to '/login'
    end

end
