class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
    @topic = Topic.find(params[:topic_id])
  end

  def create
  @record = Record.new
    
    if @record.save
      ModelMailer.new_record_notification(@record).deliver
      redirect_to @record
    end
  end

end
