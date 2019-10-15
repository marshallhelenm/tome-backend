class CharactersController < ApplicationController
    
    def getcharacters
        user = User.find(params['user']['user']['id'])
        characters = user.characters
        render :json => characters
    end

    def getstorycharacters
        # byebug
        if params['story']
            story = Story.find(params['story']['id']) 
        end

        if story
            characters = story_chars(story)
            render :json => characters
        else 
            render :json => nil
        end
    end

    def create
        user = User.find(params['character']['user']['user']['id'])
        name = params['character']['name']
        description = params['character']['description']
        world = World.find(params['character']['world']['id'])
        newChar = Character.create(name: name, description: description, world_id: world.id)
        render :json => newChar
    end


    private

    def story_chars(story)
        StoryCharacter.all.filter{ |sc|
            sc.story_id === story.id
        }
    end
end
