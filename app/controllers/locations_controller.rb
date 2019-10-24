class LocationsController < ApplicationController
    
    def getlocations
        world = World.find(loc_params['world_id'])
        locations = world.locations
        render :json => locations
    end

    def getlocation
        loc = Location.find(loc_params['id'])
        render :json => loc
    end


    def create
        name = loc_params['name']
        description = loc_params['description']
        world = World.find(loc_params['world_id'])
        newChar = Location.create(name: name, description: description, world_id: world.id)
        img_urls = loc_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, location_id: newChar.id)
        end


        render :json => newChar
    end

    def update
        location = Location.find(loc_params['location_id'])
        name = loc_params['name']
        description = loc_params['description']
        location.update(name: name, description: description)
        img_urls = loc_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, location_id: location.id)
        end
        location.save
        render :json => location
    end

    def destroy
        location = Location.find(loc_params['location_id'])
        location.destroy
        render :json => {
            message: 'Location Deleted'
        }        
    end

    private

    def loc_params
        params.require(:location).permit(:name, :description, :world_id, :user, :location_id, :img_url, :story, :id)
    end


end
