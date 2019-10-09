class WorldsController < ApplicationController
    before_action :authorized
    def index
        worlds = World.all
        render :json => worlds
    end
end
