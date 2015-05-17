class Project < ActiveRecord::Base

  has_and_belongs_to_many :users

  acts_as_votable

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }
end
