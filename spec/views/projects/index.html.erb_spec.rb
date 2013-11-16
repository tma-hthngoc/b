require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :sponsor => nil,
        :activity => nil,
        :department => nil,
        :name => "Name",
        :project_code => "Project Code"
      ),
      stub_model(Project,
        :sponsor => nil,
        :activity => nil,
        :department => nil,
        :name => "Name",
        :project_code => "Project Code"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Project Code".to_s, :count => 2
  end
end
