require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Factory' do
    context 'when a Category is created' do
      subject do
        build(:category)
      end
      it 'has a valid factory' do
        expect(subject.valid?).to be true 
      end
    end
  end

  describe 'Presence validations' do
    before { FactoryBot.build(:category) }
    it { should validate_presence_of(:name) }
  end

  describe 'Uniqueness validations' do
    before { FactoryBot.build(:category) }
    it { should validate_uniqueness_of(:name) }
  end

end

