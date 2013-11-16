require 'spec_helper'

describe "risk_summaries/new" do
  before(:each) do
    assign(:risk_summary, stub_model(RiskSummary,
      :riskfile => "",
      :project => nil
    ).as_new_record)
  end

  it "renders new risk_summary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => risk_summaries_path, :method => "post" do
      assert_select "input#risk_summary_riskfile", :name => "risk_summary[riskfile]"
      assert_select "input#risk_summary_project", :name => "risk_summary[project]"
    end
  end
end
