class Apply < ActiveRecord::Base
  belongs_to :job
  belongs_to :user
  validates :cover,  :presence => true
end
