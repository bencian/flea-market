require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  describe 'Factory' do
    context 'when a product_image is created' do
      subject do
        build(:product_image)
      end
      it 'has a valid factory' do
        expect(subject).to be_valid
      end
    end
  end

  describe 'Custom Validation' do
    context "when a product_image doesn't have an attached image" do 
      subject do
        build(:product_image)
      end

      let!(:_unattached) { subject.image.detach }

      it { expect(subject).to_not be_valid }
    end
  end

  describe 'Product Association' do
    it { should belong_to(:product) }
  end
end
