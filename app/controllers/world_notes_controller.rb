class WorldNotesController < ApplicationController
    def getworld_notes
        byebug
        world = World.find(note_params['world_id'])
        notes = world.world_notes
        render :json => notes
    end

    def getworld_note
        note = WorldNote.find(note_params['id'])
        render :json => note
    end

    def create
        note = WorldNote.create(title: note_params['title'], content: note_params['content'], world_id: note_params['world_id'])
        img_urls = note_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, world_note_id: note.id)
        end
        render :json => note
    end

    def update
        note = WorldNote.find(note_params['note_id'])
        note.update(title: note_params['title'], content: note_params['content'])
        img_urls = note_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, world_note_id: note.id)
        end
        note.save
        render :json => note
    end

    def destroy
        note = WorldNote.find(note_params['note_id'])
        note.destroy
        render :json => {
            message: 'Note Deleted'
        }        
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :world_id, :img_url, :note_id, :id, :note)
    end
end
