require 'spec_helper'

describe "web_pages/index" do
  before(:each) do
    assign(:web_pages, [
      stub_model(WebPage,
        :title => "Title",
        :description => "Description",
        :page_html => "MyText"
      ),
      stub_model(WebPage,
        :title => "Title",
        :description => "Description",
        :page_html => "MyText"
      )
    ])
  end

  it "renders a list of web_pages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
