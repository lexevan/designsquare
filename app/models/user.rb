class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         invitation_limit: 5

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  geocoded_by :location
  after_validation :geocode, if: ->(obj){ obj.location.present? and obj.location_changed? }

  enum role: [:member, :creative]

  validates :username, :first_name, :last_name, presence: true 
  validates :username, :uniqueness => {:case_sensitive => false}
  validates :username, length: {in:3..15, message: 'Username must be between 3-15 characters'}  

  has_many :posts
  has_many :comments
  has_many :positions
  has_many :educations  

  has_and_belongs_to_many :projects

  acts_as_voter

  acts_as_follower
  acts_as_followable

  acts_as_taggable_on :skills, :industries, :clients

  has_attached_file :avatar, :styles => { :large => "260x260>", :medium => "200x200>", :small => "100x100>", :thumb => "75x75>", :icon => "30x30>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def name
    "#{first_name} #{last_name}"
  end

  extend FriendlyId
  friendly_id :username, use: :slugged

end
