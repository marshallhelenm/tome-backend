class CharactersController < ApplicationController
    
    def index
        chracters = Character.all
        render :json => chracters
    end
end
