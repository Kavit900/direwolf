class User < ActiveRecord::Base
  def self.USR_ROLE
    "USR"
  end
  def self.EMP_ROLE
    "EMP"
  end
  def self.ADM_ROLE
    "ADM"
  end
  has_secure_password


  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\z/
  validates_format_of :email, :with => EMAIL_REGEX
  validates :email, :presence => true
  validates_uniquesness_of :username
  validates :username, :length => {:within => 8..25}
end
