require 'rails_helper'

RSpec.describe "searches/new", :type => :view do
  before(:each) do
    assign(:search, Search.new(
      :search => "MyString",
      :text_field_tag => "MyString"
    ))
  end

  it "renders new search form" do
    render

    assert_select "form[action=?][method=?]", searches_path, "post" do

      assert_select "input#search_search[name=?]", "search[search]"

      assert_select "input#search_text_field_tag[name=?]", "search[text_field_tag]"
    end
  end
end
