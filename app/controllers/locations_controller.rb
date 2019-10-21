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
            render :json => []
        end
    end

    def create
        name = location_params['name']
        description = location_params['description']
        newChar = Location.create(name: name, description: description, world_id: location_params['world_id'])

        # if params['story_id'] != ''
        #     story = Story.find(params['story_id'].to_i)
        #     story.locations << newChar
        # end

        render :json => newChar
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

    private

    def location_params
        params.require(:location).permit(:name, :description, :world_id)
    end


end
