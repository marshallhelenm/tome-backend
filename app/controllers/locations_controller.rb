class LocationsController < ApplicationController
    
    def getlocations
        byebug
        locations = Location.all
        render :json => locations
    end

    def getstorylocations
        # byebug
        locations = Location.all
        render :json => locations
    end
end
