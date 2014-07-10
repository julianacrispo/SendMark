class Topic < ActiveRecord::Base
  has_many :bookmarks, dependent: :destroy
  default_scope { order('created_at DESC') }
end
