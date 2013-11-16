require 'spec_helper'

describe "project_types/edit" do
  before(:each) do
    @project_type = assign(:project_type, stub_model(ProjectType,
      :name => "MyString"
    ))
  end

  it "renders the edit project_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => project_types_path(@project_type), :method => "post" do
      assert_select "input#project_type_name", :name => "project_type[name]"
    end
  end
end
