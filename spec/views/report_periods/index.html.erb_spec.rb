require 'spec_helper'

describe "report_periods/index" do
  before(:each) do
    assign(:report_periods, [
      stub_model(ReportPeriod),
      stub_model(ReportPeriod)
    ])
  end

  it "renders a list of report_periods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
