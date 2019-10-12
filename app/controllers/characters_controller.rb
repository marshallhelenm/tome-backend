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


    private

    def story_chars(story)
        StoryCharacter.all.filter{ |sc|
            sc.story_id === story.id
        }
    end
end
