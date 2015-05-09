class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:member, :creative]

  validates :username, :first_name, :last_name, presence: true 
  validates :username, uniqueness: true
  validates :username, length: {in:3..15, message: 'Username must be between 3-15 characters'}  

  has_many :posts
  has_many :comments

  acts_as_voter

  acts_as_taggable_on :skills, :industries, :clients


  def name
    "#{first_name} #{last_name}"
  end

end
