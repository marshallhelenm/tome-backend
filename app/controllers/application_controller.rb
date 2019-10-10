class ApplicationController < ActionController::API
    before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, 'a1pacafever')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            begin
                JWT.decode(token, 'a1pacafever', true, algorithm: 'HS256')
                
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        if decoded_token
        user_id = decoded_token[0]['user_id']
            user = User.find(user_id)
        end
    end

    def logged_in?
        # byebug
        !!current_user
    end

    def authorized
        # byebug
        if !logged_in?
            render json: { message: 'Please log in' }, status: :unauthorized 
        end
    end

    # def not_found
    #     render json: { error: 'not_found' }
    # end

    # def authorize_request
    #     header = request.headers['Authorization']
    #     header = header.split(' ').last if header
    #     begin
    #         @decoded = JsonWebToken.decode(header)
    #         @current_user = User.find(@decoded[:user_id])
    #     rescue ActiveRecord::RecordNotFound => e
    #         render json: { errors: e.message }, status: :unauthorized
    #     rescue JWT::DecodeError => e
    #         render json: { errors: e.message }, status: :unauthorized
    #     end
    # end

end
