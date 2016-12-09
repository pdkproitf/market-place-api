require 'spec_helper'

RSpec.describe Order, type: :model do
  let(:order) { FactoryGirl.build :order }
  subject { order }

  it { expect(order).to respond_to(:total) }
  it { expect(order).to respond_to(:user_id) }

  it { expect(order.user_id).to be_truthy }
  it { expect(order.total).to be_truthy }

  it { expect(order).to validate_numericality_of(:total).is_greater_than_or_equal_to(0) }

  describe "association" do
    it { expect(order).to belong_to :user }
    it { expect(order).to have_many(:placements) }
    it { expect(order).to have_many(:products).through(:placements) }
  end
end
