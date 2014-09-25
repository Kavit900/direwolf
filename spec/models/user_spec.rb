require 'spec_helper'
require 'rails_helper'

describe User do 
	it "is invalid without an email" do 
		@user = User.new
		expect(@user.email).not_to eq(true)
	end

	it "is invalid without a username" do 
		@user = User.new
		expect(@user.username).not_to eq(true)
	end

	it "is invalid without a password" do 
		@user = User.new
		expect(@user.password).not_to eq(true)
	end
end
