require 'spec_helper'

RSpec.describe Placement, type: :model do
  let(:placement) { FactoryGirl.build :placement }
  subject { placement }

  it { should respond_to :order_id }
  it { should respond_to :product_id }

  it { should respond_to :product_id }
  it { should respond_to :quantity }

  it { should belong_to :order }
  it { should belong_to :product }

  describe "#decrement_product_quantity!" do
    it "decreases the product quantity by the placement quantity" do
      product = placement.product
      expect{placement.decrement_product_quantity!}.to change{product.quantity}.by(-placement.quantity)
    end
  end

  describe "#valid?" do
    before do
      product_1 = FactoryGirl.create :product, price: 100, quantity: 5
      product_2 = FactoryGirl.create :product, price: 85, quantity: 10


      placement_1 = FactoryGirl.build :placement, product: product_1, quantity: 3
      placement_2 = FactoryGirl.build :placement, product: product_2, quantity: 15

      @order = FactoryGirl.build :order

      @order.placements << placement_1
      @order.placements << placement_2
    end

    it "becomes invalid due to insufficient products" do
      expect(@order).to_not be_valid
    end
  end
end
