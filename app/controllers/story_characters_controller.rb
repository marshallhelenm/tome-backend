class StoryCharactersController < ApplicationController
    def create
        story = Story.find(params['story_id'])
        character = Character.find(params['character_id'])
        story.characters << character unless story.characters.include?(character)
        render :json => story
    end

    def destroy
        story = Story.find(params['story_id'])
        character = Character.find(params['character_id'])
        story.characters.delete(character)
        render :json => story.characters
    end
end
