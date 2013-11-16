require 'spec_helper'

describe "status_reports/index" do
  before(:each) do
    assign(:status_reports, [
      stub_model(StatusReport,
        :project => nil,
        :highlight => "MyText",
        :issues_risks => "MyText",
        :next_steps => "MyText",
        :remarks => "MyText",
        :status => nil,
        :report_period => nil
      ),
      stub_model(StatusReport,
        :project => nil,
        :highlight => "MyText",
        :issues_risks => "MyText",
        :next_steps => "MyText",
        :remarks => "MyText",
        :status => nil,
        :report_period => nil
      )
    ])
  end

  it "renders a list of status_reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
