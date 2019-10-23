class StoryLocationsController < ApplicationController

    def getstorylocations
            story = Story.find(sl_params['story_id']) 
            locations = story.locations
            render :json => locations
    end

    def create
        story = Story.find(sl_params['story_id'])
        location = Location.find(sl_params['location_id'])
        story.locations << location unless story.locations.include?(location)
        render :json => story
    end

    def destroy
        story = Story.find(sl_params['story_id'])
        location = Location.find(sl_params['location_id'])
        story.locations.delete(location)
        render :json => story.locations
    end

    private

    def sl_params
        params.require(:story_location).permit(:location_id, :story_id)
    end
    
end
