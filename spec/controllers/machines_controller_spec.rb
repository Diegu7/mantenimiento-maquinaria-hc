require 'rails_helper'

RSpec.describe MachinesController, type: :controller do
  describe "GET machines#index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the machines into @machines" do
      machine1, machine2, machine3 = Machine.create(
              name: Faker::Name.name,
              machine_category: Faker::Team.name,
              section: Faker::Team.sport), 
          Machine.create(  
              name: Faker::Name.name,
              machine_section: Faker::Team.name,
              machine_category: Faker::Team.sport), Machine.create!
            get :index

      expect(assigns(:machines)).to match_array([machine1, machine2])
    end
  end
end
