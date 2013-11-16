require "spec_helper"

describe RiskSummariesController do
  describe "routing" do

    it "routes to #index" do
      get("/risk_summaries").should route_to("risk_summaries#index")
    end

    it "routes to #new" do
      get("/risk_summaries/new").should route_to("risk_summaries#new")
    end

    it "routes to #show" do
      get("/risk_summaries/1").should route_to("risk_summaries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/risk_summaries/1/edit").should route_to("risk_summaries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/risk_summaries").should route_to("risk_summaries#create")
    end

    it "routes to #update" do
      put("/risk_summaries/1").should route_to("risk_summaries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/risk_summaries/1").should route_to("risk_summaries#destroy", :id => "1")
    end

  end
end
