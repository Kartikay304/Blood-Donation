class BlooddonationController < ApplicationController
    def index
    end
    def plasama 
    end
    def why_give_blood 
    end
    def who_can_give_blood
    end
    def donation_process 
    end
    def about 
    end

    def create
        @post=Post.new(post_params)
        @post.save
        if @post.save
            flash[:notice] = "Request send successfully."
            redirect_to root_path
        else
            flash[:notice] = "Something went wrong!,Re-check the details in form"
            redirect_to root_path
        end
    end

    private
    def post_params
        params.permit(:title, :description, :username, :blood_group)
    end
end