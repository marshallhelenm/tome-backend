class StoryCharactersController < ApplicationController
    def create
        StoryCharacter.create(story_id: params['story_id'], character_id: params['character_id'])
    end
end
