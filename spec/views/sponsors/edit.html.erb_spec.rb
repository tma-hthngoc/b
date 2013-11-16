require 'spec_helper'

describe "sponsors/edit" do
  before(:each) do
    @sponsor = assign(:sponsor, stub_model(Sponsor,
      :name => "MyString",
      :initials => "MyString"
    ))
  end

  it "renders the edit sponsor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sponsors_path(@sponsor), :method => "post" do
      assert_select "input#sponsor_name", :name => "sponsor[name]"
      assert_select "input#sponsor_initials", :name => "sponsor[initials]"
    end
  end
end
