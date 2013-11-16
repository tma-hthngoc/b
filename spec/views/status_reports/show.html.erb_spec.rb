require 'spec_helper'

describe "status_reports/show" do
  before(:each) do
    @status_report = assign(:status_report, stub_model(StatusReport,
      :project => nil,
      :highlight => "MyText",
      :issues_risks => "MyText",
      :next_steps => "MyText",
      :remarks => "MyText",
      :status => nil,
      :report_period => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
