class UsersController < ApplicationController

    def login
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username} To GEHU Blood Donation Camp"
            redirect_to root_path
        else
            render 'login'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :blood_group, :age, :email, :password)
    end

end
