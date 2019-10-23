class StoryNotesController < ApplicationController
    def getstory_notes
        byebug
        story = Story.find(note_params['story_id'])
        notes = story.story_notes
        render :json => notes
    end

    def create
        byebug
        note = StoryNote.create(title: note_params['title'], content: note_params['content'], story_id: note_params['story_id'])
        render :json => note
    end

    def update
        byebug
        note = StoryNote.find(note_params['note_id'])
        note.update(title: note_params['title'], content: note_params['content'])
        note.save
        render :json => note
    end

    def destroy
        byebug
        note = StoryNote.find(note_params['story_id'])
        note.destroy
        render :json => {
            message: 'Note Deleted'
        }        
    end

    private

    def note_params
        params.require(:note).permit(:title, :content, :story_id, :img_url, :note_id)
    end
end

