class NotesController < ApplicationController
    include ApplicationHelper
  before_action :authenticate_user!
  before_action :set_note,only:[:show, :edit, :destroy, :update, :liking_users]
  before_action :correct_user, only:[:edit, :update]
  def new
  	@note = Note.new
  end

  def create
  @note = current_user.notes.build(note_params)
  	if @note.save
  	   redirect_to @note, notice: "投稿されました"
  	else
  		render :new
  	end
  end
  def edit
    
  end

  def show
  	
  end

  def index
  	@notes = Note.all.order(created_at: :desc)
  end

  def update
  	if @note.update(note_params)
  	   redirect_to @note
  	else
  	  render :new
    end
  end


  def destroy
  	@note.destroy
  	redirect_to notes_path
  end


  def liking_users
  @users = @note.liking_users
    
  end
  private
  def set_note
  	@note = Note.find(params[:id])
  end
   def note_params
   	params.require(:note).permit(:title, :content, :image, :name)
   end

    def correct_user
      note = Note.find(params[:id])
      if !current_user?(@note.user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end
end
