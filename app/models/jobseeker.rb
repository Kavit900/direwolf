class Jobseeker < ActiveRecord::Base
=begin
  def self.search(query)
    puts "SEARCH CALLED"
    #where("email like ?", "%#{query}%")

    #Job.where(author: author)
    Job.joins(:tags).where(tags: { job: query })
  end
=end
end
