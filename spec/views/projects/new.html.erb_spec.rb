require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :sponsor => nil,
      :activity => nil,
      :department => nil,
      :name => "MyString",
      :project_code => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_sponsor", :name => "project[sponsor]"
      assert_select "input#project_activity", :name => "project[activity]"
      assert_select "input#project_department", :name => "project[department]"
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_project_code", :name => "project[project_code]"
    end
  end
end
