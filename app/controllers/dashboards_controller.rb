class DashboardsController < ApplicationController

    def show
        @dashboard=Dashboard.all
    end

    def index
        @dashboard=Dashboard.new
        @A=0+Dashboard.where(blood_group: 'A+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'A+', approved: '1').sum(:received)
        @a=0+Dashboard.where(blood_group: 'A-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'A-', approved: '1').sum(:received)
        @B=0+Dashboard.where(blood_group: 'B+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'B+', approved: '1').sum(:received)
        @b=0+Dashboard.where(blood_group: 'B-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'B-', approved: '1').sum(:received)
        @AB=0+Dashboard.where(blood_group: 'AB+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'AB+', approved: '1').sum(:received)
        @ab=0+Dashboard.where(blood_group: 'AB-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'AB-', approved: '1').sum(:received)
        @O=0+Dashboard.where(blood_group: 'O+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'O+', approved: '1').sum(:received)
        @o=0+Dashboard.where(blood_group: 'O-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'O-', approved: '1').sum(:received)
        @S=@A+@a+@B+@b+@AB+@ab+@O+@o+1
    end

    def create
        @dashboard=Dashboard.new(dashboard_params)
        @dashboard.user=Current.user
        @A=0+Dashboard.where(blood_group: 'A+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'A+', approved: '1').sum(:received)
        @a=0+Dashboard.where(blood_group: 'A-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'A-', approved: '1').sum(:received)
        @B=0+Dashboard.where(blood_group: 'B+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'B+', approved: '1').sum(:received)
        @b=0+Dashboard.where(blood_group: 'B-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'B-', approved: '1').sum(:received)
        @AB=0+Dashboard.where(blood_group: 'AB+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'AB+', approved: '1').sum(:received)
        @ab=0+Dashboard.where(blood_group: 'AB-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'AB-', approved: '1').sum(:received)
        @O=0+Dashboard.where(blood_group: 'O+', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'O+', approved: '1').sum(:received)
        @o=0+Dashboard.where(blood_group: 'O-', approved: '1').sum(:donated)-Dashboard.where(blood_group: 'O-', approved: '1').sum(:received)
        @S=@A+@a+@B+@b+@AB+@ab+@O+@o+1
        if @dashboard.save
            if Current.user.admin?
                flash[:notice] = "Donation Added Successfully"
                redirect_to dashboard_path(Current.user.id)
            else
                flash[:notice] = "#{@dashboard.username}, your request send to admin for approval"
                redirect_to dashboard_path(Current.user.id)
            end
        else 
            render 'index'
        end
    end

    def edit
        @dashboard = Dashboard.find(params[:id])
        @user = User.find(@dashboard.user_id)
    end

    def update
        @user=User.new
        @dashboard = Dashboard.find(params[:id])
        if @dashboard.update(dashboard_params)
            flash[:notice] = "User Request Approved"
            render 'show'
        else
            flash[:notice] = "Unknown Error Detected"
            render 'edit'
        end
    end

    private

    def dashboard_params
        params.require(:dashboard).permit(:username, :blood_group, :received, :donated, :approved, :camp , :user_id)
    end

end
