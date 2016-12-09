require 'spec_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.build :order }
  subject { order }

  it { expect(order).to respond_to(:total) }
  it { expect(order).to respond_to(:user_id) }

  it { expect(order.user_id).to be_truthy }
  it { expect(order.total).to be_truthy }

  describe "association" do
    it { expect(order).to belong_to :user }
    it { expect(order).to have_many(:placements) }
    it { expect(order).to have_many(:products).through(:placements) }
  end

  describe '#set_total!' do
    before(:each) do
      product_1 = FactoryGirl.create :product, price: 100
      product_2 = FactoryGirl.create :product, price: 85

      @order = FactoryGirl.build :order, product_ids: [product_1.id, product_2.id]
    end

    it "returns the total amount to pay for the products" do
      expect{@order.set_total!}.to change{@order.total}.from(0).to(185)
    end
  end
end
