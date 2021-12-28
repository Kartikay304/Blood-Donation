class BlooddonationController < ApplicationController
    def index
        @cores = [{ name: "Kartikay Kala", img: "https://avatars.githubusercontent.com/u/40604582?v=4", link: "https://github.com/Kartikay304" }]
    end

    def create
        @post=Post.new(post_params)
        if @post.save
            flash[:notice] = "Request send successfully."
            redirect_to root_path
        else
            flash[:notice] = "Something went wrong! Re-check the details filled in the form"
            redirect_to root_path
        end
    end

    private
    def post_params
        params.permit(:title, :description, :username, :blood_group)
    end
end