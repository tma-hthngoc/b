require "spec_helper"

describe PipelineController do
  describe "routing" do

    it "routes to #pipeline" do
      get("/pipeline").should route_to("pipeline#index")
      get("/pipeline/index").should route_to("pipeline#index")
    end

    it "routes to #archive" do
      get("/archive").should route_to("pipeline#archive")
      get("/pipeline/archive").should route_to("pipeline#archive")
    end
  end
end
