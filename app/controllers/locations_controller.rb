class LocationsController < ApplicationController
    
    def getlocations
        # byebug
        world = World.find(params['world']['id'])
        locations = world.locations
        render :json => locations
    end

    def getstorylocations
        if params['story']
            story = Story.find(params['story']['id']) 
            locations = story.locations
            render :json => locations
        else 
            render :json => nil
        end
    end

    def create
        byebug
        name = params['location']['name']
        description = params['location']['description']
        world = World.find(params['location']['world']['id'])
        newLoc = Location.create(name: name, description: description, world_id: world.id)

        if params['story_id'] != ''
            story = Story.find(params['location']['story_id'].to_i)
            story.locations << newLoc
        end

        render :json => newLoc
    end

    def update
        # byebug
        location = Location.find(params['location']['id'])
        name = params['name']
        description = params['description']
        location.update(name: name, description: description)
        location.save
        render :json => location
    end

    def destroy
        # byebug
        location = Location.find(params['location']['id'])
        location.destroy
        render :json => {
            message: 'Location Deleted'
        }        
    end
end
