class SessionsController < ApplicationController
    before_action :loggin_redirect, only: [:new,:create]
    def new 
        
    end

    def create 
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id 
            redirect_to root_path
            flash[:success] = "You have successfully logged in"
        else
            redirect_to login_path
            flash[:negative] = "Wrong login credentials"
        end
    end

    def delete 
        session[:user_id] = nil 
        redirect_to login_path
        flash[:success] = "Successfully logged out"
    end

    private

    def loggin_redirect
        if logged_in?
            flash[:error] = "You are already logged in"
            redirect_to root_path
        end
    end
end
