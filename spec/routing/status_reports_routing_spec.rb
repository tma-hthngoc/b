require "spec_helper"

describe StatusReportsController do
  describe "routing" do

    it "routes to #index" do
      get("/status_reports").should route_to("status_reports#index")
    end

    it "routes to #new" do
      get("/status_reports/new").should route_to("status_reports#new")
    end

    it "routes to #show" do
      get("/status_reports/1").should route_to("status_reports#show", :id => "1")
    end

    it "routes to #edit" do
      get("/status_reports/1/edit").should route_to("status_reports#edit", :id => "1")
    end

    it "routes to #create" do
      post("/status_reports").should route_to("status_reports#create")
    end

    it "routes to #update" do
      put("/status_reports/1").should route_to("status_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/status_reports/1").should route_to("status_reports#destroy", :id => "1")
    end

  end
end
