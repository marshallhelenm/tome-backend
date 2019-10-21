class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    # def index
    #     users = User.all
    #     render :json => users
    # end

    def create
        if user_params['password'] == user_params['confirm_password']
            user = User.create(user_params)
            if user.valid?
                render json: {
                    user: UserSerializer.new(user)
                }, status: :created
            else
                render json: {error: 'That username is already taken.'}, status: :not_acceptable
            end
        else 
            render json: {error: "Passwords must match."}
        end

    end


    private

    def user_params
        params.require(:user).permit(:username, :password, :confirm_password, :default_world_id)
    end

end
