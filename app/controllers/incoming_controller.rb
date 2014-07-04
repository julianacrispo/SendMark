class IncomingController < ApplicationController
 
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def index 
    @topic = Topic.new

  end

  def create
    #match_header(“subject”, “#"")
    @topic = @Topic.new(
    category: params[:subject])
    @new_topic.save
    head 200
  end
end




#psuedocode
# @new_bookmark = Bookmark.new (
# link: params[:text],
# title: params[:subject])
# @new_bookmark.save