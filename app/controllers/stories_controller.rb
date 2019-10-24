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

    def getstory
        story = Story.find(story_params['id'])
        render :json => story
    end

    def create
        title = story_params['title']
        description = story_params['description']
        world = World.find(story_params['world'])
        newStory = Story.create(title: title, description: description, world_id: world.id)
        img_urls = story_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, story_id: newStory.id)
        end
        render :json => newStory
    end

    def update
        story = Story.find(story_params['id'])
        title = story_params['title']
        description = story_params['description']
        story.update(title: title, description: description)
        img_urls = story_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, story_id: story.id)
        end
        story.save
        render :json => story
    end

    def destroy
        story = Story.find(story_params['id'])
        story.destroy
        render :json => {
            message: 'Story Deleted'
        }        
    end

    private

    def story_params
        params.require(:story).permit(:title, :description, :user_id, :img_url, :world_id, :id, :world)
    end

end
