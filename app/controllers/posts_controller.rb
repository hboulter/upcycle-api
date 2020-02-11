class PostsController < ApplicationController
    include Rails.application.routes.url_helpers

    def index
        posts = Post.all
        posts_with_images = posts.map{ |post| { post: post, image: rails_blob_path(post.image) }}
        render json: posts_with_images
    end

    def show
        post = Post.find(params[:id])
        image = rails_blob_path(post.image, disposition: "attachment", only_path: true)
        render json: { post: post, image: image }
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

    def post_update
        post = Post.find(params[:id])
        post.update(post_params)
        image_url = rails_blob_path(post.image)
        render json: { post: post, image_url: image_url }
    end

    def destroy
        post = Post.find(params[:id])
        if post
            post.destroy
            render json: { message: 'deleted post', id: post.id };
        end
    end

    def cleanup
        Post.where(['created_at < ?', 7.days.ago]).destroy_all
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :lat, :lng, :status, :title, :condition, :description, :image)
    end

end