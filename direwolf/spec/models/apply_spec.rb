require 'spec_helper'
require 'rails_helper'

describe Apply do 
	it "is invalid without a cover" do 
		@apply = Apply.new
		expect(@apply.cover).not_to eq(true)
	end
end
