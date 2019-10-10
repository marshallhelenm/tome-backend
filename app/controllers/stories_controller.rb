class StoriesController < ApplicationController
    
    def getstories
        @user = params['user']['user']
        all_stories = Story.all
        stories = all_stories.filter{ |story| story['user_id'] == @user['id'] }
        render :json => stories
    end
end
