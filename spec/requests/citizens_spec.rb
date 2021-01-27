 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/citizens", type: :request do
  # Citizen. As you add validations to Citizen, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    attributes_for(:citizen)
  }

  let(:invalid_attributes) {
    attributes_for(:citizen, full_name: '')
  }

  describe "GET /index" do
    it "renders a successful response" do
      create(:citizen)
      get citizens_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      citizen = create(:citizen)
      get citizen_url(citizen)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_citizen_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      citizen = create(:citizen)
      get edit_citizen_url(citizen)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_attributes) {
        a = attributes_for(:citizen)
        a['address_attributes'] = attributes_for(:address)
        a
      }
      it "creates a new Citizen" do
        expect {
          post citizens_url, params: { citizen: valid_attributes }
        }.to change(Citizen, :count).by(1)
      end
    end

    context "with invalid parameters" do
      let(:valid_attributes) {
        a = attributes_for(:citizen, full_name: '')
        a['address_attributes'] = attributes_for(:address)
        a
      }
      it "does not create a new Citizen" do
        expect {
          post citizens_url, params: { citizen: invalid_attributes }
        }.to change(Citizen, :count).by(0)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        attributes_for(:citizen, full_name: 'New full name')
      }

      it "updates the requested citizen" do
        citizen = create(:citizen)
        patch citizen_url(citizen), params: { citizen: new_attributes }
        citizen.reload
        expect(citizen.full_name).to eq ('New full name')
      end
    end

    context "with invalid parameters" do
      let(:invalid_attributes) {
        attributes_for(:citizen, full_name: 'New full name', email: 'abc@')
      }
      it "not updates the requested citizen" do
        citizen = create(:citizen)
        patch citizen_url(citizen), params: { citizen: invalid_attributes }
        citizen.reload
        expect(citizen.full_name).to_not eq ('New full name')
      end
    end
  end
end
