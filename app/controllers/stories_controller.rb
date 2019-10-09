class StoriesController < ApplicationController
    before_action :authorized
    
    def index
        stories = Story.all
        render :json => stories
    end
end
