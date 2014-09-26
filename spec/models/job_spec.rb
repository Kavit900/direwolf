require 'spec_helper'
require 'rails_helper'

describe Job do 
	it "is invalid without a title" do 
		@job = Job.new
		expect(@job.title).not_to eq(true)
	end

	it "is invalid without a deadline" do
		@job = Job.new
		expect(@job.deadline).not_to eq(true)
	end
end
