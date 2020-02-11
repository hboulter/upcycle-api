class UsersController < ApplicationController
    def index
        users = User.all
        if users
            render json: {
                users: users
            }
        else
            render json: {
                status: 500,
                errors: ['no users found']
            }
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def create
        user = User.create!(
            username: params['user']['username'],
            password: params['user']['password'],
            password_confirmation: params['user']['password_confirmation']
        )
        if user
            session[:user_id] = user.id
            render json: {
                status: :created,
                user: user
            }
        else
            render json: { error: 500 }
        end
    end

end