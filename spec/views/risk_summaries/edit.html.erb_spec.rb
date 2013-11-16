require 'spec_helper'

describe "risk_summaries/edit" do
  before(:each) do
    @risk_summary = assign(:risk_summary, stub_model(RiskSummary,
      :riskfile => "",
      :project => nil
    ))
  end

  it "renders the edit risk_summary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => risk_summaries_path(@risk_summary), :method => "post" do
      assert_select "input#risk_summary_riskfile", :name => "risk_summary[riskfile]"
      assert_select "input#risk_summary_project", :name => "risk_summary[project]"
    end
  end
end
