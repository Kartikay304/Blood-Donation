class DashboardController < ApplicationController

    def index
    end

    def create
        @userdonation=Userdonation.new(userdonation_params)
        @userdonation.save
        if @userdonation.save
            flash[:notice] = "#{@userdonation.username}, Donation request is send to the admin"
            redirect_to dashboard_path(Current.user.id)
        else
            flash[:notice] = "Something went wrong"
            redirect_to dashboard_path(Current.user.id)
        end
    end

    private
    def userdonation_params
        params.permit(:username, :blood_group, :donated, :camp)
    end

end
