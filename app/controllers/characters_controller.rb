class CharactersController < ApplicationController
    
    def getcharacters
        world = World.find(char_params['world_id'])
        characters = world.characters
        render :json => characters
    end

    def getcharacter
        char = Character.find(char_params['id'])
        render :json => char
    end

    def create
        name = char_params['name']
        description = char_params['description']
        world = World.find(char_params['world_id'])
        newChar = Character.create(name: name, description: description, world_id: world.id)
        img_urls = char_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, character_id: newChar.id)
        end


        render :json => newChar
    end

    def update
        character = Character.find(char_params['character_id'])
        name = char_params['name']
        description = char_params['description']
        character.update(name: name, description: description)
        img_urls = char_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, character_id: character.id)
        end
        character.save
        render :json => character
    end

    def destroy
        character = Character.find(char_params['character_id'])
        character.destroy
        render :json => {
            message: 'Character Deleted'
        }        
    end

    private

    def char_params
        params.require(:character).permit(:name, :description, :world_id, :user, :character_id, :img_url, :story, :id)
    end


end
