class BlooddonationController < ApplicationController
    def index
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