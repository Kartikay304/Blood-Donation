class DashboardController < ApplicationController

    def index
        @A=Userdonation.where(blood_group: 'A+').sum(:donated)
        @a=Userdonation.where(blood_group: 'A-').sum(:donated)
        @B=Userdonation.where(blood_group: 'B+').sum(:donated)
        @b=Userdonation.where(blood_group: 'B-').sum(:donated)
        @AB=Userdonation.where(blood_group: 'AB+').sum(:donated)
        @ab=Userdonation.where(blood_group: 'AB-').sum(:donated)
        @O=Userdonation.where(blood_group: 'O+').sum(:donated)
        @o=Userdonation.where(blood_group: 'O-').sum(:donated)
    end

    def create
        @userdonation=Userdonation.new(userdonation_params)
        @userdonation.save
        if @userdonation.save
            flash[:notice] = "#{@userdonation.username}, Donation request is send to the admin"
            redirect_to dashboard_path(Current.user.id)
        else
            flash[:notice] = "Something went wrong!,Re-check the details in form"
            redirect_to dashboard_path(Current.user.id)
        end
    end

    private
    def userdonation_params
        params.permit(:username, :blood_group, :received, :donated, :camp)
    end

end
