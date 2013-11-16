require 'spec_helper'

describe "RiskSummaries" do
  describe "GET /risk_summaries" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get risk_summaries_path
      response.status.should be(200)
    end
  end
end
