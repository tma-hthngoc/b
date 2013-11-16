require 'spec_helper'

describe "report_periods/show" do
  before(:each) do
    @report_period = assign(:report_period, stub_model(ReportPeriod))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
