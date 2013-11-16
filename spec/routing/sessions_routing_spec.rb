require "spec_helper"

describe SessionsController do
  describe "routing" do

    it "routes to #create" do
      post("/sessions").should route_to("sessions#create")
    end

    it "routes to #destroy" do
      delete("/sessions").should route_to("sessions#destroy")
    end

  end
end
