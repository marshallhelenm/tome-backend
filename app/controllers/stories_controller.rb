class StoriesController < ApplicationController
    
    def getstories
        user = User.find(params['user']['user']['id'])
        render :json => user.stories
    end

    def getworldstories
        world = World.find(params['world']['id'])
        render :json => world.stories
    end

    def create
        user = User.find(params['story']['user']['user']['id'])
        title = params['story']['title']
        description = params['story']['description']
        world = World.find(params['story']['world']['id'])
        newStory = Story.create(title: title, description: description, world_id: world.id)
        render :json => newStory
    end

    def update
        byebug
        # story = Story.find
    end

end
