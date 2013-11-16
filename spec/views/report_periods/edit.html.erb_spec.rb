require 'spec_helper'

describe "report_periods/edit" do
  before(:each) do
    @report_period = assign(:report_period, stub_model(ReportPeriod))
  end

  it "renders the edit report_period form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => report_periods_path(@report_period), :method => "post" do
    end
  end
end
