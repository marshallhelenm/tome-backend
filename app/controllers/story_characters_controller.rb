class StoryCharactersController < ApplicationController
    def create
        StoryCharacter.create(story_id: params['story_id'], character_id: params['character_id'])
        story = Story.find(params['story_id'])
        render :json => story
    end
end
