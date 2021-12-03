class UsersController < ApplicationController

    def donor_signup
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username} To GEHU Blood Donation Camp"
            redirect_to root_path
        else
            render 'donor_signup'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
