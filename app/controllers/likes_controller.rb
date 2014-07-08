class LikesController < ApplicationController

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Liked bookmark"
      redirect_to [@topic]
    else
      flash[:error] = "Unable to Like. Please try again"
      redirect_to [@topic]
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])

    if like.destroy
      flash[:notice] = "unliked"
      redirect_to [@topic]
    else
      flash[:error] = "unable to remove like. Please try again"
      redirect_to [@topic]
    end
  end
end
