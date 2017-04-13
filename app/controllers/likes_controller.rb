class LikesController < ApplicationController
	  def like
    note = Note.find(params[:note_id])
    like = current_user.likes.build(note_id: note.id)
    like.save
    redirect_to note    
  end

  def unlike
    note = Note.find(params[:note_id])
    like = current_user.likes.find_by(note_id: note.id)
    like.destroy
    redirect_to note
  end
end
