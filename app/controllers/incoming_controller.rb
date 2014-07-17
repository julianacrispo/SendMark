class IncomingController < ApplicationController
 
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create, :index]

  def index
    puts "INCOMING PARAMS HERE: #{params}"
    head 200
  end

  def create
    puts "INCOMING PARAMS HERE: #{params}"
    user = User.find_by_email params[:sender]
    # user ||= User.create email: params[:sender], password: 'secret', password_confirmation: 'secret'

    category = params[:subject] #todo: extract hashtag from subject
    #if category contains # do the below, else just move onto parsing the body of the email
    category = category.split("#").last.split(" ").first
      topic = Topic.find_by_category( category )
        if topic.nil?
          topic = Topic.new(category: category)
          topic.save
        end
    url = params[:body]
    @bookmark = Bookmark.new( url: params[:body] )
    @bookmark.topic = topic
    @bookmark.user = user
    @bookmark.save
    head 200
  end
end
#   def post
#      # process various message parameters:
#      sender  = params['from']
#      subject = params['subject']

#      # get the "stripped" body of the message, i.e. without
#      # the quoted part
#      actual_body = params["stripped-text"]

#      # process all attachments:
#      count = params['attachment-count'].to_i
#      count.times do |i|
#        stream = params["attachment-#{i+1}"]
#        filename = stream.original_filename
#        data = stream.read()
#      end
#      render :text => "OK"
#    end
# end

#   def index 
#     @topic = Topic.new

#   end

#   def create
#     #match_header(“subject”, “#"")
#     @topic = @Topic.new(
#     category: params[:subject])
#     @new_topic.save
#     head 200
#   end
# end





#psuedocode
# @new_bookmark = Bookmark.new (
# link: params[:text],
# title: params[:subject])
# @new_bookmark.save