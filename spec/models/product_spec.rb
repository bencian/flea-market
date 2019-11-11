require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Factory' do
    context 'when a product is created' do
      subject do
        build(:product)
      end
      it 'has a valid factory' do
        expect(subject).to be_valid
      end
    end
  end

  describe 'Category Association' do
    it { should belong_to(:category) }
  end

  describe 'Presence validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:code) }
  end

  describe 'Uniqueness validations' do
    subject { build(:product) }
    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code).case_insensitive }
  end

  describe 'Numericality validations' do
    it { should validate_numericality_of(:code) }
    it { should validate_numericality_of(:code).only_integer }
    it { should validate_numericality_of(:price) }
    it { should validate_numericality_of(:cost) }
  end

  describe 'Custom Validation' do
    subject do
      build(:product)
    end

    context "when a product doesn't have a primary image" do
      let!(:_without_primary) { subject.product_images.delete_all }

      it { expect(subject).to_not be_valid }
    end

    context "when a product has more than one primary image" do
      let!(:product_image) { build(:product_image, product: subject) }
      let!(:_with_several_primary) { subject.product_images << product_image }

      it { expect(subject).to_not be_valid }
    end
  end
end
