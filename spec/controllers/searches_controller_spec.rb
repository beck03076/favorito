require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe "GET index" do
    it "assigns @search" do
      get :index
      expect(assigns(:search)).to be_kind_of(Search)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
end
