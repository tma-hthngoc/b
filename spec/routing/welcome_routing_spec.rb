require "spec_helper"

describe WelcomeController do
  describe "routing" do

    it "default route, routes to #index" do
      get("/").should route_to("welcome#index")
    end
    it "routes to #index" do
      get("welcome/index").should route_to("welcome#index")
    end

  end
end
