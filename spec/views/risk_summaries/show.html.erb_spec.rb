require 'spec_helper'

describe "risk_summaries/show" do
  before(:each) do
    @risk_summary = assign(:risk_summary, stub_model(RiskSummary,
      :riskfile => "",
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
