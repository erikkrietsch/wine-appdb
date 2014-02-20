require "spec_helper"

describe WineAppsController do
  describe "routing" do

    it "routes to #index" do
      expect(get("/apps")).to route_to("wine_apps#index")
    end

    it "routes to #new" do
      expect(get("/apps/new")).to route_to("wine_apps#new")
    end

    it "routes to #show" do
      expect(get("/apps/1")).to route_to("wine_apps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/apps/1/edit")).to route_to("wine_apps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/apps")).to route_to("wine_apps#create")
    end

    it "routes to #update" do
      expect(put("/apps/1")).to route_to("wine_apps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/apps/1")).to route_to("wine_apps#destroy", :id => "1")
    end

  end
end
