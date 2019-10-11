class StoriesController < ApplicationController
    
    def getstories
        user = User.find(params['user']['user']['id'])
        render :json => user.stories
    end

    def getworldstories
        world = World.find(params['world']['id'])
        render :json => world.stories
    end

end
