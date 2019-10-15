class LocationsController < ApplicationController
    
    def getlocations
        byebug
        world = World.find(params['world']['id'])
        locations = world.locations
        render :json => locations
    end

    def getstorylocations
        byebug
        if params['story']
            story = Story.find(params['story']['id']) 
        end

        if story
            locations = story_locs(story)
            render :json => locations
        else 
            render :json => nil
        end
    end

    def create
        byebug
        user = User.find(params['location']['user']['user']['id'])
        name = params['location']['name']
        description = params['location']['description']
        world = World.find(params['location']['world']['id'])
        newChar = Location.create(name: name, description: description, world_id: world.id)
        render :json => newChar
    end

    def update
        byebug
        location = Location.find(params['location']['id'])
        name = params['name']
        description = params['description']
        location.update(name: name, description: description)
        location.save
        render :json => location
    end

    def destroy
        byebug
        location = Location.find(params['location']['id'])
        location.destroy
        render :json => {
            message: 'Location Deleted'
        }        
    end


    private

    def story_locs(story)
        StoryLocation.all.filter{ |sc|
            sc.story_id === story.id
        }
    end
end
