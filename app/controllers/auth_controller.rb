class AuthController < ApplicationController
    skip_before_action :authorized, only: [:login]

    def login
        user = User.find_by(username: login_params[:username])
        if user.authenticate(login_params[:password]) === false
            render json: { error: 'Invalid username or password' }, status: :unauthorized
        else
            token = encode_token({user_id: user.id})
            render json: { user: UserSerializer.new(user), token: token }, status: :accepted
        end
            
    end

    def index
    end

    def show 
    end

    def create
    end

    private

    def login_params
        params.require(:user).permit(:username, :password)
    end

end
