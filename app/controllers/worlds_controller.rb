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
        # byebug
        user_id = params['world']['user_id']
        name = params['world']['name']
        description = params['world']['description']
        newWorld = World.create(name: name, description: description, user_id: user_id)
        # byebug
        # newWorld.photo.attach(world_params[:photo])
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

    def world_params
        params.require(:world).permit(:name, :description, :user_id, :photo)
    end

    # def image_upload
    #     byebug
    #     Cloudinary::Uploader.upload(params['image'], :folder => 'WorldBuildersTome/')
    # end

private
    def user_params
        params.require('world').permit(:name, :description, :image)
    end


end
 