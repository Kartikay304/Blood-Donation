class SessionsController < ApplicationController
    
    def signin
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged In Successfully"
            redirect_to root_path
        else
            flash.now[:alert] = "Invalid Credentials"
            render 'signin'
        end
    end

    def destroy
        session[:user_id] = nil 
        flash[:notice] = "Logged Out Successfully"
        redirect_to root_path
    end
    
end