require 'spec_helper'

describe "web_pages/new" do
  before(:each) do
    assign(:web_page, stub_model(WebPage,
      :title => "MyString",
      :description => "MyString",
      :page_html => "MyText"
    ).as_new_record)
  end

  it "renders new web_page form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => web_pages_path, :method => "post" do
      assert_select "input#web_page_title", :name => "web_page[title]"
      assert_select "input#web_page_description", :name => "web_page[description]"
      assert_select "textarea#web_page_page_html", :name => "web_page[page_html]"
    end
  end
end
