class UsersController < ApplicationController

    def signup
        @user = User.new
    end

    def edit
        @user=User.find(params[:id])
    end

    def update
        @user =User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account information as successfully updated"
            redirect_to root_path
        else
            render 'edit'
        end
    end

    def dashboard 
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome #{@user.username} To GEHU Blood Donation Camp"
            redirect_to root_path
        else
            render 'signup'
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :blood_group, :age, :email, :password)
    end

end
