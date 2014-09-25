require 'rails_helper'
require 'spec_helper'

describe SessionsController do 
	it "should logout the user and display the notice" do
		flash[:notice].should_not be_nil
	end
end
