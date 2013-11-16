require 'spec_helper'

describe "report_periods/new" do
  before(:each) do
    assign(:report_period, stub_model(ReportPeriod).as_new_record)
  end

  it "renders new report_period form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => report_periods_path, :method => "post" do
    end
  end
end
