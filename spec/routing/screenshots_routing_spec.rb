require "spec_helper"

describe ScreenshotsController do
  describe "routing" do

    it "routes to #index" do
      get("/screenshots").should route_to("screenshots#index")
    end

    it "routes to #new" do
      get("/screenshots/new").should route_to("screenshots#new")
    end

    it "routes to #show" do
      get("/screenshots/1").should route_to("screenshots#show", :id => "1")
    end

    it "routes to #edit" do
      get("/screenshots/1/edit").should route_to("screenshots#edit", :id => "1")
    end

    it "routes to #create" do
      post("/screenshots").should route_to("screenshots#create")
    end

    it "routes to #update" do
      put("/screenshots/1").should route_to("screenshots#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/screenshots/1").should route_to("screenshots#destroy", :id => "1")
    end

  end
end
