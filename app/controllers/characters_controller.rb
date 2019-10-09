class CharactersController < ApplicationController
    before_action :authorized
    
    def index
        chracters = Character.all
        render :json => chracters
    end
end
