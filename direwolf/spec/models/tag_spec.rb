require 'spec_helper'
require 'rails_helper'

describe Tag do 
	it "is invalid without a tag" do 
		@tag = Tag.new
		expect(@tag.tag).not_to eq(true)
	end
end