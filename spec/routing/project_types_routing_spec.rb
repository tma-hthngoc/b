require "spec_helper"

describe ProjectTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/project_types").should route_to("project_types#index")
    end

    it "routes to #new" do
      get("/project_types/new").should route_to("project_types#new")
    end

    it "routes to #show" do
      get("/project_types/1").should route_to("project_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/project_types/1/edit").should route_to("project_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/project_types").should route_to("project_types#create")
    end

    it "routes to #update" do
      put("/project_types/1").should route_to("project_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/project_types/1").should route_to("project_types#destroy", :id => "1")
    end

  end
end
