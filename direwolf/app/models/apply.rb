class Apply < ActiveRecord::Base

  belongs_to :job

  validates :cover,  :presence => true
end
