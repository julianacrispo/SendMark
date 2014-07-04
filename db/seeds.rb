require 'faker'

5.times do 
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
    )

  user.save
end
users = User.all

10.times do
  Topic.create(
    category: Faker::Lorem.sentence
    )
end
topics = Topic.all

20.times do 
  bookmark = Bookmark.create(
    user: users.sample,
    topic: topics.sample, 
    url: Faker::Lorem.characters(10)
    )

    bookmark.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
    #bookmark.update_rank
  end
  bookmarks = Bookmark.all


  

  puts "seed finished"
  puts "#{User.count} Users created"
  puts "#{Topic.count} Topics created"
  puts "#{Bookmark.count} Bookmarks created"

