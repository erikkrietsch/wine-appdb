require "spec_helper"

describe WineAppsController do
  describe "routing" do

    it "routes to #index" do
      get("/wine_apps").should route_to("wine_apps#index")
    end

    it "routes to #new" do
      get("/wine_apps/new").should route_to("wine_apps#new")
    end

    it "routes to #show" do
      get("/wine_apps/1").should route_to("wine_apps#show", :id => "1")
    end

    it "routes to #edit" do
      get("/wine_apps/1/edit").should route_to("wine_apps#edit", :id => "1")
    end

    it "routes to #create" do
      post("/wine_apps").should route_to("wine_apps#create")
    end

    it "routes to #update" do
      put("/wine_apps/1").should route_to("wine_apps#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/wine_apps/1").should route_to("wine_apps#destroy", :id => "1")
    end

  end
end
