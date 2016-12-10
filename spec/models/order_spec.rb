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

      placement_1 = FactoryGirl.build :placement, product: product_1, quantity: 3
      placement_2 = FactoryGirl.build :placement, product: product_2, quantity: 15

      @order = FactoryGirl.build :order

      @order.placements << placement_1
      @order.placements << placement_2
    end

    it "returns the total amount to pay for the products" do
      expect{@order.set_total!}.to change{@order.total.to_f}.from(0).to(1575)
    end
  end

  describe "#build_placements_with_product_ids_and_quantities" do
    before(:each) do
      product_1 = FactoryGirl.create :product, price: 100, quantity: 5
      product_2 = FactoryGirl.create :product, price: 85, quantity: 10

      @product_ids_and_quantities = [[product_1.id, 2], [product_2.id, 3]]
    end

    it "builds 2 placements for the order" do
      expect{order.build_placements_with_product_ids_and_quantities(@product_ids_and_quantities)}.to change{order.placements.size}.from(0).to(2)
    end
  end
end
