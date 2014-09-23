class Job < ActiveRecord::Base
  belongs_to :field
  has_and_belongs_to_many :tags

  validates :title, :presence => true
  validates :deadline, :presence => true
end
