require 'spec_helper'

describe "statuses/new" do
  before(:each) do
    assign(:status, stub_model(Status,
      :name => "MyString",
      :icon_url => "MyString",
      :order => 1
    ).as_new_record)
  end

  it "renders new status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => statuses_path, :method => "post" do
      assert_select "input#status_name", :name => "status[name]"
      assert_select "input#status_icon_url", :name => "status[icon_url]"
      assert_select "input#status_order", :name => "status[order]"
    end
  end
end
