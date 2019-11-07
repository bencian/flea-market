require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'Factory' do
    context 'when a Tag is created' do
      subject do
        build(:tag)
      end
      it 'has a valid factory' do
        expect(subject.valid?).to be true 
      end
    end
  end

  describe 'Presence validations' do
    before { FactoryBot.build(:tag) }
    it { should validate_presence_of(:name) }
  end

  describe 'Uniqueness validations' do
    before { FactoryBot.build(:tag) }
    it { should validate_uniqueness_of(:name) }
  end

end
