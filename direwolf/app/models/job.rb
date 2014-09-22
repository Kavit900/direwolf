class Job < ActiveRecord::Base
  has_one :field
  has_and_belongs_to_many :tags

  validates :title, :presence => true
  validates :deadline, :presence => true
end
