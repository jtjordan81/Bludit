class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :comments
  has_many :moderators, dependent: :destroy
  has_many :subbludits, through: :moderators

  acts_as_voter

  validates_presence_of :name
  validates_uniqueness_of :name

  def admin?
    self.permission == "admin"
  end

end
