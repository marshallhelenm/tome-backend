class StoryNotesController < ApplicationController
    def getstory_notes
        byebug
        story = Story.find(params['story']['id'])
        notes = story.story_notes
        render :json => notes
    end

    def create
        note = StoryNote.create(title: params['note']['title'], content: ['content'], story_id: params['note']['story']['id'])
        render :json => note
    end

    def update
        byebug
        note = StoryNote.find(params['note']['note']['id'])
        note.update(title: params['note']['title'], content: params['note']['content'])
        note.save
        render :json => note
    end

    def destroy
        byebug
        note = StoryNote.find(params['note']['note']['id'])
        note.destroy
        render :json => {
            message: 'Note Deleted'
        }        
    end

end
