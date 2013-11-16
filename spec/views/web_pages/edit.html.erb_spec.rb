require 'spec_helper'

describe "web_pages/edit" do
  before(:each) do
    @web_page = assign(:web_page, stub_model(WebPage,
      :title => "MyString",
      :description => "MyString",
      :page_html => "MyText"
    ))
  end

  it "renders the edit web_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => web_pages_path(@web_page), :method => "post" do
      assert_select "input#web_page_title", :name => "web_page[title]"
      assert_select "input#web_page_description", :name => "web_page[description]"
      assert_select "textarea#web_page_page_html", :name => "web_page[page_html]"
    end
  end
end
