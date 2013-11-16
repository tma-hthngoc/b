require 'spec_helper'

describe "status_reports/new" do
  before(:each) do
    assign(:status_report, stub_model(StatusReport,
      :project => nil,
      :highlight => "MyText",
      :issues_risks => "MyText",
      :next_steps => "MyText",
      :remarks => "MyText",
      :status => nil,
      :report_period => nil
    ).as_new_record)
  end

  it "renders new status_report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => status_reports_path, :method => "post" do
      assert_select "input#status_report_project", :name => "status_report[project]"
      assert_select "textarea#status_report_highlight", :name => "status_report[highlight]"
      assert_select "textarea#status_report_issues_risks", :name => "status_report[issues_risks]"
      assert_select "textarea#status_report_next_steps", :name => "status_report[next_steps]"
      assert_select "textarea#status_report_remarks", :name => "status_report[remarks]"
      assert_select "input#status_report_status", :name => "status_report[status]"
      assert_select "input#status_report_report_period", :name => "status_report[report_period]"
    end
  end
end
