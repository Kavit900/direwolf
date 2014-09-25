require 'rails_helper'
require 'spec_helper'

describe UsersController do 
	it "should show notcie on successful save" do 
		flash[:notice].should_not be_nil
end
end