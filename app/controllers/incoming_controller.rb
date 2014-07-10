class IncomingController < ApplicationController
 
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create, :index]

    def index
      puts "INCOMING PARAMS HERE: #{params}"
      head 200
    end

    def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    logger.info "!!!!!!!!!!!!!!!!"
    logger.info "INCOMING PARAMS HERE: #{params}"
    @topic = @Topic.new(
      category: params[:subject])
      @new_topic.save

    # You put the message-splitting and business
    # magic here. 

    # Assuming all went well. 
    head 200
  end

  def post
     # process various message parameters:
     sender  = params['from']
     subject = params['subject']

     # get the "stripped" body of the message, i.e. without
     # the quoted part
     actual_body = params["stripped-text"]

     # process all attachments:
     count = params['attachment-count'].to_i
     count.times do |i|
       stream = params["attachment-#{i+1}"]
       filename = stream.original_filename
       data = stream.read()
     end
     render :text => "OK"
   end
end

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