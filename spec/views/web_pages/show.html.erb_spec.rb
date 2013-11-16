require 'spec_helper'

describe "web_pages/show" do
  before(:each) do
    @web_page = assign(:web_page, stub_model(WebPage,
      :title => "Title",
      :description => "Description",
      :page_html => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Description/)
    rendered.should match(/MyText/)
  end
end
