require 'spec_helper'

describe "StatusReports" do
  describe "GET /status_reports" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get status_reports_path
      response.status.should be(200)
    end
  end
end
