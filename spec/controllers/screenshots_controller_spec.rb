require 'spec_helper'


describe ScreenshotsController do

  # This should return the minimal set of attributes required to create a valid
  # Screenshot. As you add validations to Screenshot, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { title: "heyo" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScreenshotsController. Be sure to keep this updated too.
  let(:valid_session) { { } }

  let(:ss) { FactoryGirl.create(:screenshot_with_wine_app) }
  let(:screenshot) { FactoryGirl.create(:screenshot) }
  let(:screenshots) { FactoryGirl.create_list(:screenshot, 2) }

  describe "GET index" do
    it "assigns all WineApp screenshots as @screenshots when nested under a wine_app" do
      get :index, {wine_app_id: ss.wine_app.slug }
      expect(assigns(:screenshots)).to eq [ss]
    end

    it "assigns all screenshots as @screenshots when not fed a wine_app_id" do
      if screenshots
        get :index
        expect(assigns(:screenshots)).to eq screenshots
      end
    end
  end

  describe "GET show" do
    it "assigns the requested screenshot as @screenshot" do
      get :show, {id: ss.to_param, wine_app_id: ss.wine_app.slug }, valid_session
      expect(assigns(:screenshot)).to eq ss
    end
  end

  describe "GET new" do
    it "assigns a new screenshot as @screenshot" do
      get :new, {}, valid_session
      expect(assigns(:screenshot)).to be_a_new Screenshot
    end
  end

  describe "GET edit" do
    it "assigns the requested screenshot as @screenshot" do
      get :edit, {:id => screenshot.to_param}, valid_session
      expect(assigns(:screenshot)).to eq screenshot
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Screenshot" do
        expect {
          post :create, {:screenshot => valid_attributes}, valid_session
        }.to change(Screenshot, :count).by(1)
      end

      it "assigns a newly created screenshot as @screenshot" do
        post :create, {:screenshot => valid_attributes}, valid_session
        assigns(:screenshot).should be_a(Screenshot)
        assigns(:screenshot).should be_persisted
      end

      it "redirects to the created screenshot" do
        post :create, {:screenshot => valid_attributes}, valid_session
        response.should redirect_to(Screenshot.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved screenshot as @screenshot" do
        # Trigger the behavior that occurs when invalid params are submitted
        Screenshot.any_instance.stub(:save).and_return(false)
        post :create, {:screenshot => {  }}, valid_session
        assigns(:screenshot).should be_a_new(Screenshot)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Screenshot.any_instance.stub(:save).and_return(false)
        post :create, {:screenshot => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested screenshot" do
        # Assuming there are no other screenshots in the database, this
        # specifies that the Screenshot created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Screenshot.any_instance.should_receive(:update).with({ "title" => "what" })
        put :update, {id: screenshot.to_param, screenshot: { "title" => "what" }}, valid_session
      end

      it "assigns the requested screenshot as @screenshot" do
        if screenshot
          put :update, {id: screenshot.to_param, screenshot: { title: "what" } }, valid_session
          expect(assigns(:screenshot)).to eq screenshot
        end
      end

      it "redirects to the screenshot" do
        put :update, {:id => screenshot.to_param, :screenshot => valid_attributes}, valid_session
        expect(response).to redirect_to(screenshot)
      end
    end

    describe "with invalid params" do
      it "assigns the screenshot as @screenshot" do
        # Trigger the behavior that occurs when invalid params are submitted
        Screenshot.any_instance.stub(:save).and_return(false)
        put :update, {:id => screenshot.to_param, :screenshot => {  }}, valid_session
        expect(assigns(:screenshot)).to eq screenshot
      end

      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Screenshot.any_instance.stub(:save).and_return(false)
        put :update, {:id => screenshot.to_param, :screenshot => {  }}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested screenshot" do
      if screenshot
        expect {
          delete :destroy, {:id => screenshot.to_param}, valid_session
        }.to change(Screenshot, :count).by(-1)
      end
    end

    it "redirects to the screenshots list if destroyed from the screenshots index view" do
      delete :destroy, {:id => screenshot.to_param}, valid_session
      expect(response).to redirect_to(screenshots_url)
    end

    it "redirects to the wine_app if destroyed from the wine_app/screenshots index view" do
      delete :destroy, {id: ss.to_param, wine_app_id: ss.wine_app.slug }, valid_session
      expect(response).to redirect_to wine_app_path(ss.wine_app) 
    end

  end

end
