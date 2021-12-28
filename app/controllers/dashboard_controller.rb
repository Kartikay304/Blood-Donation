class DashboardController < ApplicationController

    def index
        @A=Userdonation.where(blood_group: 'A+').sum(:donated)-Userdonation.where(blood_group: 'A+').sum(:received)
        @a=Userdonation.where(blood_group: 'A-').sum(:donated)-Userdonation.where(blood_group: 'A-').sum(:received)
        @B=Userdonation.where(blood_group: 'B+').sum(:donated)-Userdonation.where(blood_group: 'B+').sum(:received)
        @b=Userdonation.where(blood_group: 'B-').sum(:donated)-Userdonation.where(blood_group: 'B-').sum(:received)
        @AB=Userdonation.where(blood_group: 'AB+').sum(:donated)-Userdonation.where(blood_group: 'AB+').sum(:received)
        @ab=Userdonation.where(blood_group: 'AB-').sum(:donated)-Userdonation.where(blood_group: 'AB-').sum(:received)
        @O=Userdonation.where(blood_group: 'O+').sum(:donated)-Userdonation.where(blood_group: 'O+').sum(:received)
        @o=Userdonation.where(blood_group: 'O-').sum(:donated)-Userdonation.where(blood_group: 'O-').sum(:received)
        @S=@A+@a+@B+@b+@AB+@ab+@O+@o
    end

    def create
        @userdonation=Userdonation.new(userdonation_params)
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
