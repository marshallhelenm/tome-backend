class WorldsController < ApplicationController
    def getworlds
        worlds = World.all
        render :json => worlds
    end

    def show
        byebug
    end

    def create
        byebug
    end
end
 