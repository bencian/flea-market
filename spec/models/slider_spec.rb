require 'rails_helper'

RSpec.describe Slider, type: :model do
  describe 'Factory' do
    context 'when a slider is created' do
      subject do
        build(:slider)
      end
      it 'has a valid factory' do
        expect(subject.valid?).to be true 
      end
    end
  end

  describe 'Presence validations' do
    subject { FactoryBot.build(:slider) }
    it { should validate_presence_of(:name) }
  end

  describe 'Uniqueness validations' do
    subject { FactoryBot.build(:slider) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'Custom Validation' do
    context "when a slider doesn't have an attached image" do 
      subject do
        build(:slider)
      end

      let!(:_unattached) { subject.image.detach }

      it { expect(subject).to_not be_valid }
    end
  end

end
