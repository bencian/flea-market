require 'rails_helper'

RSpec.describe FrontendConfiguration, type: :model do
  describe 'Factory' do
    context 'when FrontendConfiguration is created' do
      subject do
        build(:frontend_configuration)
      end
      it 'has a valid factory' do
        expect(subject.valid?).to be true
      end
    end
  end

  describe 'Uniqueness validations' do
    subject { FactoryBot.build(:frontend_configuration) }
    it { should validate_uniqueness_of(:singleton_guard) }
  end

  describe 'Custom Validation' do
    context "when another frontend_configuration exists" do
      subject do
        build(:frontend_configuration)
      end

      let!(:second_frontend_configuration) { build(:frontend_configuration) }

      it do
        subject.singleton_guard = 1
        expect(subject).to_not be_valid
      end
    end
  end
end
