class StoryNotesController < ApplicationController
    def getstory_notes
        story = Story.find(note_params['story_id'])
        notes = story.story_notes
        render :json => notes
    end

    def getstory_note
        # byebug
        note = StoryNote.find(note_params['id'])
        render :json => note
    end

    def create
        note = StoryNote.create(title: note_params['title'], content: note_params['content'], story_id: note_params['story_id'])
        img_urls = note_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, story_note_id: note.id)
        end
        render :json => note
    end

    def update
        note = StoryNote.find(note_params['note_id'])
        note.update(title: note_params['title'], content: note_params['content'])
        img_urls = note_params['img_url'].split(', ')
        img_urls.each do |url|
            Image.create(url: url, story_note_id: note.id)
        end
        note.save
        render :json => note
    end

    def destroy
        note = StoryNote.find(note_params['note_id'])
        note.destroy
        render :json => {
            message: 'Note Deleted'
        }        
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :story_id, :img_url, :note_id, :id, :note)
    end
end

 