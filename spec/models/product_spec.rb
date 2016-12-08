require 'spec_helper'

RSpec.describe Product, type: :model do
  let(:product) { FactoryGirl.build :product }
  subject { product }

  describe "test respond attribute" do
    it { expect(product).to respond_to(:title) }
    it { expect(product).to respond_to(:price) }
    it { expect(product).to respond_to(:published) }
    it { expect(product).to respond_to(:user_id) }
  end

  describe "validate attribute" do
    it  { expect(product.title).to be_truthy }
    it  { expect(product.price).to be_truthy }
    it { expect(product).to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    it  { expect(product.user_id).to be_truthy }
  end

end
