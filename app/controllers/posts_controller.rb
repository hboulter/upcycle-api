class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: { posts: posts }
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def create
        post = Post.new(post_params)
        if post.valid?
            post.save
        end
    end

    private

    def post_params
        params.require(:posts).permit(:lat, :lng, :status, :condition, :description)
    end

end