class Job < ActiveRecord::Base
  has_one :field
  has_and_belongs_to_many :tags
end
