class StoriesController < ApplicationController
    
    # def getstories
    #     byebug
    #     user = User.find(story_params['user_id'])
    #     render :json => user.stories
    # end

    def getworldstories
        world = World.find(story_params['world_id'])
        render :json => world.stories
    end

    def create
        byebug
        user = User.find(story_params['user'])
        title = story_params['title']
        description = story_params['description']
        world = World.find(story_params['world'])
        newStory = Story.create(title: title, description: description, world_id: world.id)
        render :json => newStory
    end

    def update
        byebug
        story = Story.find(story_params['currentStory'])
        title = story_params['title']
        description = story_params['description']
        story.update(title: title, description: description)
        story.save
        render :json => story
    end

    def destroy
        byebug
        story = Story.find(story_params['id'])
        story.destroy
        render :json => {
            message: 'Story Deleted'
        }        
    end

    private

    def story_params
        params.require(:story).permit(:title, :description, :user_id, :img_url, :world_id, :id)
    end

end
