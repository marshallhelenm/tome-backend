class WorldsController < ApplicationController
    def getworlds
        @user = params['user']['user']
        all_worlds = World.all
        worlds = all_worlds.filter{ |world| world['user_id'] == @user['id'] }
        render :json => worlds
    end

    def show
        byebug
    end

    def create
        byebug
    end
end
 