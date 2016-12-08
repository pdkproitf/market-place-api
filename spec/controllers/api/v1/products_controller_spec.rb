require 'spec_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do

  describe "GET #index" do
    before(:each) do
      4.times { FactoryGirl.create :product }
      get :index
    end

    it "return 4 recodes from database" do
      product_response = json_response
      expect(product_response).to have(4).items
    end

    it { expect respond_with 200 }
  end

  describe "GET #show" do
    before(:each) do
      @product = FactoryGirl.create :product
      get :show, id: @product.id
    end

    it "return the information about a reporter on a hash" do
      product_response = json_response
      expect(product_response[:title]).to eql @product.title
    end

    it { expect respond_with 200 }
  end
end
