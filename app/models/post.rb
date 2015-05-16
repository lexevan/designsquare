class Post < ActiveRecord::Base
  belongs_to :user

  acts_as_commentable
  acts_as_votable

  default_scope { order(created_at: :desc) }
end
