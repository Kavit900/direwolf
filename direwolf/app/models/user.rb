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
end
