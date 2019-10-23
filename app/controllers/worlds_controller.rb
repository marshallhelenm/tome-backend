class WorldsController < ApplicationController
    def getworlds
        user = User.find(params['user']['user']['id'])
        worlds = user.worlds
        render :json => worlds
    end

    def show
        byebug
    end

    def create
        user_id = world_params['user_id']
        name = world_params['name']
        description = world_params['description']
        newWorld = World.create(name: name, description: description, user_id: user_id)
        img_urls = world_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, world_id: newWorld.id)
        end
        render :json => newWorld
    end

    def edit 
    end

    def update
        # byebug
        world = World.find(world_params['currentWorld'])
        name = world_params['name']
        description = world_params['description']
        world.update(name: name, description: description)
        img_urls = world_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, world_id: world.id)
        end
        world.save
        render :json => world
        
    end

    def destroy
        world = World.find(world_params['id'] )
        world.destroy
        render :json => {
            message: 'World Deleted'
        }
    end

    private

    def world_params
        params.require(:world).permit(:name, :description, :user_id, :img_url, :currentWorld, :id)
    end

end