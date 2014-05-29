require 'spec_helper'


describe ScreenshotsController do

  # This should return the minimal set of attributes required to create a valid
  # Screenshot. As you add validations to Screenshot, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ScreenshotsController. Be sure to keep this updated too.
  let(:valid_session) { { } }

  let(:screenshot) { FactoryGirl.create(:screenshot) }

  describe "GET index" do
    it "assigns all screenshots as @screenshots" do
      get :index, {wine_app_id: screenshot.wine_app.id }
      binding.pry
      assigns(:screenshots).should eq([screenshot])
    end
  end

  describe "GET show" do
    it "assigns the requested screenshot as @screenshot" do
      screenshot = Screenshot.create! valid_attributes
      get :show, {:id => screenshot.to_param}, valid_session
      assigns(:screenshot).should eq(screenshot)
    end
  end

  describe "GET new" do
    it "assigns a new screenshot as @screenshot" do
      get :new, {}, valid_session
      assigns(:screenshot).should be_a_new(Screenshot)
    end
  end

  describe "GET edit" do
    it "assigns the requested screenshot as @screenshot" do
      screenshot = Screenshot.create! valid_attributes
      get :edit, {:id => screenshot.to_param}, valid_session
      assigns(:screenshot).should eq(screenshot)
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
        screenshot = Screenshot.create! valid_attributes
        # Assuming there are no other screenshots in the database, this
        # specifies that the Screenshot created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Screenshot.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => screenshot.to_param, :screenshot => { "these" => "params" }}, valid_session
      end

      it "assigns the requested screenshot as @screenshot" do
        screenshot = Screenshot.create! valid_attributes
        put :update, {:id => screenshot.to_param, :screenshot => valid_attributes}, valid_session
        assigns(:screenshot).should eq(screenshot)
      end

      it "redirects to the screenshot" do
        screenshot = Screenshot.create! valid_attributes
        put :update, {:id => screenshot.to_param, :screenshot => valid_attributes}, valid_session
        response.should redirect_to(screenshot)
      end
    end

    describe "with invalid params" do
      it "assigns the screenshot as @screenshot" do
        screenshot = Screenshot.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Screenshot.any_instance.stub(:save).and_return(false)
        put :update, {:id => screenshot.to_param, :screenshot => {  }}, valid_session
        assigns(:screenshot).should eq(screenshot)
      end

      it "re-renders the 'edit' template" do
        screenshot = Screenshot.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Screenshot.any_instance.stub(:save).and_return(false)
        put :update, {:id => screenshot.to_param, :screenshot => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested screenshot" do
      screenshot = Screenshot.create! valid_attributes
      expect {
        delete :destroy, {:id => screenshot.to_param}, valid_session
      }.to change(Screenshot, :count).by(-1)
    end

    it "redirects to the screenshots list" do
      screenshot = Screenshot.create! valid_attributes
      delete :destroy, {:id => screenshot.to_param}, valid_session
      response.should redirect_to(screenshots_url)
    end
  end

end
