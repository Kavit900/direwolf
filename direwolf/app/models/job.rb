class Job < ActiveRecord::Base
  belongs_to :field
  has_and_belongs_to_many :tags
  has_many :applies

  validates :title, :presence => true
  validates :deadline, :presence => true
end
