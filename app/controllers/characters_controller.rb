class CharactersController < ApplicationController
    
    def getcharacters
        # byebug
        world = World.find(params['world']['id'])
        characters = world.characters
        render :json => characters
    end

    def getstorycharacters
        if params['story']
            story = Story.find(params['story']['id']) 
            characters = story.characters
            render :json => characters
        else 
            render :json => []
        end
    end

    def create
        name = params['name']
        description = params['description']
        world = World.find(params['world']['id'])
        newChar = Character.create(name: name, description: description, world_id: world.id)

        if params['story_id'] != ''
            story = Story.find(params['story_id'].to_i)
            story.characters << newChar
        end

        render :json => newChar
    end

    def update
        # byebug
        character = Character.find(params['character']['id'])
        name = params['name']
        description = params['description']
        character.update(name: name, description: description)
        character.save
        render :json => character
    end

    def destroy
        # byebug
        character = Character.find(params['character']['id'])
        character.destroy
        render :json => {
            message: 'Character Deleted'
        }        
    end


end
