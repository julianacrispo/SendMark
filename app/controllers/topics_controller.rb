class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def create

  end
  
  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks
  end

end
