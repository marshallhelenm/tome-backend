class StoryCharactersController < ApplicationController

    def getstorycharacters
            story = Story.find(sc_params['story_id']) 
            characters = story.characters
            render :json => characters
    end


    def create
        story = Story.find(sc_params['story_id'])
        character = Character.find(sc_params['character_id'])
        story.characters << character unless story.characters.include?(character)
        render :json => story
    end

    def destroy
        story = Story.find(sc_params['story_id'])
        character = Character.find(sc_params['character_id'])
        story.characters.delete(character)
        render :json => story.characters
    end

    private

    def sc_params
        params.require(:story_character).permit(:character_id, :story_id)
    end


end
