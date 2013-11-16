require "spec_helper"

describe ProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("/projects").should route_to("projects#index")
    end

    it "routes to #new" do
      get("/projects/new").should route_to("projects#new")
    end

    it "routes to #show" do
      get("/projects/1").should route_to("projects#show", :id => "1")
    end

    it "routes to #edit" do
      get("/projects/1/edit").should route_to("projects#edit", :id => "1")
    end

    it "routes to #create" do
      post("/projects").should route_to("projects#create")
    end

    it "routes to #update" do
      put("/projects/1").should route_to("projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/projects/1").should route_to("projects#destroy", :id => "1")
    end

    it "routes to status_reports#index" do
      get("/projects/1/status_reports").should route_to("status_reports#index", :project_id => "1")
    end

    it "routes to status_reports#new" do
      get("/projects/1/status_reports/new").should route_to("status_reports#new", :project_id => "1")
    end

    it "routes to status_reports#show" do
      get("/projects/1/status_reports/1").should route_to("status_reports#show", :id => "1", :project_id => '1')
    end

    it "routes to #create" do
      post("/projects/1/status_reports").should route_to("status_reports#create", :project_id => '1')
    end
  end
end
