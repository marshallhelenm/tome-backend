class CharactersController < ApplicationController
    
    def getcharacters
        user = User.find(params['user']['user']['id'])
        characters = user.characters
        render :json => characters
    end

    def getstorycharacters
        byebug
        story = Story.find(params['story']['id'])
        characters = story_chars(story)
        render :json => characters
    end


    private

    def story_chars(story)
        StoryCharacter.all.filter{ |sc|
            byebug
            sc.story_id === story.id
        }
    end
end
