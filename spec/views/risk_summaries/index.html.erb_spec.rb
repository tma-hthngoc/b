require 'spec_helper'

describe "risk_summaries/index" do
  before(:each) do
    assign(:risk_summaries, [
      stub_model(RiskSummary,
        :riskfile => "",
        :project => nil
      ),
      stub_model(RiskSummary,
        :riskfile => "",
        :project => nil
      )
    ])
  end

  it "renders a list of risk_summaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
