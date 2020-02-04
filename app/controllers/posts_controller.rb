class PostsController < ApplicationController
    def index
        posts = Post.all
        render json: { posts: posts }
    end

    def show
        post = Post.find(params[:id])
        image = rails_blob_path(post.image)

        if user.password == params[:password]
            render json: {post: post, image: image}
        else
            render json: { message: 'This user is not authenticated'}
        render json: post
        end
    end

    def create
        post = Post.new(post_params)
        post.save
        render json: post
    end

    def update
        post = Post.find(params[:id])
        post.update(image: params[:image])
        image_url = rails_blob_path(post.image)
        render json: { post: post, image_url: image_url }
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :lat, :lng, :status, :condition, :description, :image)
    end

end