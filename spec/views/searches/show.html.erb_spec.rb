require 'rails_helper'

RSpec.describe "searches/show", :type => :view do
  before(:each) do
    @search = assign(:search, Search.create!(
      :search => "Search",
      :text_field_tag => "Text Field Tag"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Search/)
    expect(rendered).to match(/Text Field Tag/)
  end
end
