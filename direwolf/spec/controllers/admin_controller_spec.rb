require 'rails_helper'
require 'spec_helper'

describe AdminController do 
	it "admin should not have a blank email" do 
		@admin = User.new(:role => 'ADM')
		@admin.should_not be_nil
	end
end
