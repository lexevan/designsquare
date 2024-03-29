class Post < ActiveRecord::Base
  belongs_to :user

  acts_as_commentable
  acts_as_votable

  default_scope { order(created_at: :desc) }

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end
