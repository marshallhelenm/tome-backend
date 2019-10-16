class StoryNotesController < ApplicationController
    def getstory_notes
        story = Story.find(params['story']['id'])
        notes = story.story_notes
        render :json => notes
    end

    def create
        byebug
        note = StoryNote.create(title: params['note']['title'], content: params['note']['content'], story_id: params['note']['story']['id'])
        render :json => note
    end

    def update
        note = StoryNote.find(params['note']['id'])
        note.update(title: params['title'], content: params['content'])
        note.save
        render :json => note
    end

    def destroy
        note = StoryNote.find(params['story_note']['id'])
        note.destroy
        render :json => {
            message: 'Note Deleted'
        }        
    end

end
