require "spec_helper"

describe ReportPeriodsController do
  describe "routing" do

    it "routes to #index" do
      get("/report_periods").should route_to("report_periods#index")
    end

    it "routes to #new" do
      get("/report_periods/new").should route_to("report_periods#new")
    end

    it "routes to #show" do
      get("/report_periods/1").should route_to("report_periods#show", :id => "1")
    end

    it "routes to #edit" do
      get("/report_periods/1/edit").should route_to("report_periods#edit", :id => "1")
    end

    it "routes to #create" do
      post("/report_periods").should route_to("report_periods#create")
    end

    it "routes to #update" do
      put("/report_periods/1").should route_to("report_periods#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/report_periods/1").should route_to("report_periods#destroy", :id => "1")
    end

  end
end
