require 'rails_helper'

RSpec.describe "searches/index", :type => :view do
  before(:each) do
    assign(:searches, [
      Search.create!(
        :search => "Search",
        :text_field_tag => "Text Field Tag"
      ),
      Search.create!(
        :search => "Search",
        :text_field_tag => "Text Field Tag"
      )
    ])
  end

  it "renders a list of searches" do
    render
    assert_select "tr>td", :text => "Search".to_s, :count => 2
    assert_select "tr>td", :text => "Text Field Tag".to_s, :count => 2
  end
end
