require 'rails_helper'

RSpec.describe "searches/edit", :type => :view do
  before(:each) do
    @search = assign(:search, Search.create!(
      :search => "MyString",
      :text_field_tag => "MyString"
    ))
  end

  it "renders the edit search form" do
    render

    assert_select "form[action=?][method=?]", search_path(@search), "post" do

      assert_select "input#search_search[name=?]", "search[search]"

      assert_select "input#search_text_field_tag[name=?]", "search[text_field_tag]"
    end
  end
end
