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
        user = User.find(params['world']['user']['user']['id'])
        name = params['world']['name']
        description = params['world']['description']
        newWorld = World.create(name: name, description: description)
        user.worlds << newWorld
        render :json => newWorld
    end

    def edit 
    end

    def update
        world = World.find(params['currentWorld']['id'])
        name = params['name']
        description = params['description']
        world.update(name: name, description: description)
        world.save
        render :json => world
        
    end

    def destroy
        world = World.find(params['world']['id'] )
        world.destroy
        render :json => {
            message: 'World Deleted'
        }
    end

end
 