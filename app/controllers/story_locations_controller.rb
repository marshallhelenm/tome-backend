class StoryLocationsController < ApplicationController
    def create
        story = Story.find(params['story_id'])
        location = Location.find(params['location_id'])
        story.locations << location unless story.locations.include?(location)
        render :json => story
    end
end
